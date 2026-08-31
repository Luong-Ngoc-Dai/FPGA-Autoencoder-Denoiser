import os
import math
import numpy as np
from tensorflow.keras.models import load_model
from tensorflow.keras.datasets import mnist

# 1. Cấu hình
NUM_IMAGES = 100
NOISE_STD = 0.5
OUTPUT_DIR = r"C:\Nam_3_HK2_2025_2026\Do_an_1\hls_test_data"
os.makedirs(OUTPUT_DIR, exist_ok=True)

def calculate_metrics(clean_img, processed_img):
    # MSE: Mean Squared Error
    mse = np.mean((clean_img - processed_img) ** 2)
    if mse == 0:
        return 0, 100.0 # Không có lỗi, PSNR mặc định là 100
    
    # PSNR: Peak Signal-to-Noise Ratio
    # Với ảnh đã normalize (0-1), Max pixel value = 1.0
    psnr = 10 * math.log10(1.0 / mse)
    return mse, psnr

# --- Trong vòng lặp xuất 100 ảnh ---
total_mse_p = 0
total_psnr_p = 0

# 2. Load Model và Dữ liệu
model = load_model("C:/Nam_3_HK2_2025_2026/Do_an_1/result\denoiser.h5", compile=False)# Tên file phải khớp với bước 1
(_, _), (x_test, _) = mnist.load_data()
x_test = x_test.astype('float32') / 255.0

# 3. Vòng lặp xuất file
for idx in range(NUM_IMAGES):
    clean = x_test[idx]
    
    # Tạo nhiễu
    noise = np.random.normal(0.0, NOISE_STD, clean.shape)
    noisy = np.clip(clean + noise, 0., 1.)
    
    # Chạy Model Python để lấy "Gold Output" (Đáp án chuẩn)
    # Chuyển (28,28) -> (1,28,28,1) để model hiểu
    input_tensor = noisy.reshape(1, 28, 28, 1)
    prediction = model.predict(input_tensor, verbose=0)
    gold = prediction.reshape(28, 28)

    mse_p, psnr_p = calculate_metrics(clean, gold) # So sánh ảnh gốc và ảnh Python dự đoán
    total_mse_p += mse_p
    total_psnr_p += psnr_p
    # LƯU FILE (Dùng np.savetxt cho nhanh và chuẩn)
    # File 1: Ảnh nhiễu (Đầu vào cho C++)
    np.savetxt(os.path.join(OUTPUT_DIR, f"test_input_{idx}.txt"), noisy, fmt='%.6f')
    
    # File 2: Ảnh sạch gốc (Để tính PSNR thực tế)
    np.savetxt(os.path.join(OUTPUT_DIR, f"test_ground_truth_{idx}.txt"), clean, fmt='%.6f')
    
    # File 3: Ảnh Python dự đoán (Để so sánh tính đúng đắn của C++)
    np.savetxt(os.path.join(OUTPUT_DIR, f"gold_output_{idx}.txt"), gold, fmt='%.6f')

    if (idx + 1) % 20 == 0:
        print(f"Đã xuất: {idx + 1}/100")
    if (idx + 1) % 20 == 0:
        print(f"Image {idx+1}: MSE={mse_p:.6f}, PSNR={psnr_p:.2f} dB")

print("-" * 30)
print(f"AVERAGE PYTHON METRICS (100 images):")
print(f"Avg MSE: {total_mse_p/NUM_IMAGES:.6f}")
print(f"Avg PSNR: {total_psnr_p/NUM_IMAGES:.2f} dB")