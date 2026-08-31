import numpy as np
import os
import matplotlib.pyplot as plt
from PIL import Image

# Cấu hình
INPUT_DIR = "C:/Nam_3_HK2_2025_2026/Do_an_1/gold"        # Thư mục chứa file denoised_output_X.txt
OUTPUT_DIR = "C:/Nam_3_HK2_2025_2026/Do_an_1/gold_output"  # Thư mục xuất ảnh
NUM_IMAGES = 100             # Số ảnh muốn chuyển

# Tạo thư mục output
os.makedirs(OUTPUT_DIR, exist_ok=True)

def read_image_txt(filename):
    """Đọc file .txt thành ma trận 28x28"""
    with open(filename, 'r') as f:
        data = []
        for line in f:
            numbers = line.strip().split()
            for num in numbers:
                data.append(float(num))
        img = np.array(data).reshape(28, 28)
        return img

def save_as_png(img_array, filename):
    """Lưu ma trận thành file PNG"""
    # Chuyển từ float [0,1] sang uint8 [0,255]
    img_uint8 = (img_array * 255).astype(np.uint8)
    img_pil = Image.fromarray(img_uint8, mode='L')
    img_pil.save(filename)

# Đọc và chuyển từng ảnh
success_count = 0
for idx in range(NUM_IMAGES):
    input_file = os.path.join(INPUT_DIR, f"gold_output_{idx}.txt")
    
    if os.path.exists(input_file):
        # Đọc ảnh denoise
        denoised = read_image_txt(input_file)
        
        # Lưu thành PNG
        output_file = os.path.join(OUTPUT_DIR, f"image_{idx:03d}.png")
        save_as_png(denoised, output_file)
        
        success_count += 1
        
        # In tiến độ
        if (idx + 1) % 20 == 0:
            print(f"✅ Converted {idx + 1}/{NUM_IMAGES} images")
    else:
        print(f"⚠️ File not found: {input_file}")

print(f"\n✅ Done! Converted {success_count} images to '{OUTPUT_DIR}/'")