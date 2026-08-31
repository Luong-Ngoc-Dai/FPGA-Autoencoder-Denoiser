import numpy as np
import os
from tensorflow.keras.datasets import mnist

# Cấu hình
NUM_IMAGES = 100  # Số ảnh muốn tạo (tối đa 10000)
NOISE_STD = 0.5   # Mức nhiễu (giống khi train)
OUTPUT_DIR = "test_images"

# Tạo thư mục
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Load MNIST
(_, _), (x_test, _) = mnist.load_data()
print(f"✅ Loaded MNIST test set: {x_test.shape[0]} images")

# Tạo file cho NUM_IMAGES ảnh đầu tiên
for idx in range(min(NUM_IMAGES, 10000)):
    # Lấy ảnh gốc
    clean = x_test[idx].astype('float32') / 255.0
    
    # Thêm nhiễu Gaussian
    noise = np.random.normal(0.0, NOISE_STD, clean.shape)
    noisy = np.clip(clean + noise, 0., 1.)
    
    # Lưu ảnh nhiễu
    input_path = os.path.join(OUTPUT_DIR, f"test_input_{idx}.txt")
    with open(input_path, 'w') as f:
        for i in range(28):
            for j in range(28):
                f.write(f"{noisy[i][j]:.6f}")
                if j < 27:
                    f.write(" ")
            f.write("\n")
    
    # Lưu ảnh gốc (ground truth)
    gt_path = os.path.join(OUTPUT_DIR, f"test_ground_truth_{idx}.txt")
    with open(gt_path, 'w') as f:
        for i in range(28):
            for j in range(28):
                f.write(f"{clean[i][j]:.6f}")
                if j < 27:
                    f.write(" ")
            f.write("\n")
    
    if (idx + 1) % 20 == 0:
        print(f"Created {idx + 1}/{NUM_IMAGES} images")

print(f"\n✅ Done! Created {NUM_IMAGES} test image pairs in '{OUTPUT_DIR}/'")
print("   - test_input_X.txt: ảnh nhiễu")
print("   - test_ground_truth_X.txt: ảnh sạch")