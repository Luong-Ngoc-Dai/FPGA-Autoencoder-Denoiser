import os
import numpy as np
import tensorflow as tf

model = tf.keras.models.load_model(r"C:\Nam_3_HK2_2025_2026\Do_an_1\result\denoiser.h5", compile=False)

def export_conv_kernel(layer_index, filename, var_name, fixed_type='fixed_t'):
    """Export kernel theo thứ tự [oc, ic, kH, kW] giống Py2C"""
    w = model.layers[layer_index].get_weights()[0]  # shape: [kH, kW, ic, oc]
    b = model.layers[layer_index].get_weights()[1]  # shape: [oc]
    
    # Transpose sang [oc, ic, kH, kW] — ĐÚNG như Py2C dòng 154
    w_transposed = np.transpose(w, (3, 2, 0, 1)).flatten()
    
    kH, kW, ic, oc = w.shape
    
    with open(filename, 'w') as f:
        f.write(f'#ifndef {var_name.upper()}_H\n')
        f.write(f'#define {var_name.upper()}_H\n')
        f.write(f'#include "denoiser.h"\n\n')
        
        # Kernel
        f.write(f'const {fixed_type} {var_name}_kernel[{len(w_transposed)}] = {{\n    ')
        for i, v in enumerate(w_transposed):
            f.write(f'{fixed_type}({v:.8f}f)')
            if i < len(w_transposed)-1:
                f.write(', ')
            if (i+1) % 8 == 0:
                f.write('\n    ')
        f.write('\n};\n\n')
        
        # Bias
        f.write(f'const {fixed_type} {var_name}_bias[{oc}] = {{\n    ')
        for i, v in enumerate(b):
            f.write(f'{fixed_type}({v:.8f}f)')
            if i < len(b)-1:
                f.write(', ')
        f.write('\n};\n')
        f.write(f'#endif\n')
    
    print(f'Exported {var_name}: kernel{w.shape} -> [{oc},{ic},{kH},{kW}], {len(w_transposed)} values')

# Gọi cho từng layer — thay layer_index cho đúng model của bạn
export_conv_kernel(1, 'conv1_weights.h', 'conv1')  # conv2d_1: 1→4
export_conv_kernel(3, 'conv2_weights.h', 'conv2')  # conv2d_2: 4→8  
export_conv_kernel(5, 'conv3_weights.h', 'conv3')  # conv2d_3: 8→4
export_conv_kernel(6, 'conv_out_weights.h', 'conv_out')  # output: 4→1
print("Files saved at:", os.getcwd())