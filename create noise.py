import os
import numpy as np
import matplotlib.pyplot as plt
from tensorflow.keras.datasets import mnist

# ========================== CONFIG ==========================
NOISE_STD = 0.5
SAVE_DIR = r"C:\Nam_3_HK2_2025_2026\Do_an_1\noise_image"

# tạo thư mục lưu
os.makedirs(SAVE_DIR, exist_ok=True)

print("Thư mục hiện tại:", os.getcwd())
print("Thư mục lưu ảnh:", os.path.abspath(SAVE_DIR))

# ========================== LOAD DATA ==========================
(x_train, _), (x_test, _) = mnist.load_data()

# Normalize về [0,1]
x_test = x_test.astype("float32") / 255.

# reshape (28,28) → (28,28,1)
x_test = np.reshape(x_test, (-1, 28, 28, 1))

# ========================== GAUSSIAN NOISE ==========================
def add_gaussian_noise(x, std=0.5):
    """
    x̃ = x + n, với n ~ N(0, σ²)
    Theo Pascal Vincent (Denoising Autoencoder)
    """
    noise = np.random.normal(loc=0.0, scale=std, size=x.shape)
    x_noisy = x + noise
    return np.clip(x_noisy, 0., 1.)

# tạo ảnh nhiễu
x_test_noisy = add_gaussian_noise(x_test, NOISE_STD)

# ========================== HIỂN THỊ ==========================
n = 10
plt.figure(figsize=(12,4))

for i in range(n):
    # ảnh gốc
    plt.subplot(2, n, i+1)
    plt.imshow(x_test[i].reshape(28,28), cmap='gray')
    plt.title("Gốc")
    plt.axis("off")

    # ảnh nhiễu
    plt.subplot(2, n, i+1+n)
    plt.imshow(x_test_noisy[i].reshape(28,28), cmap='gray')
    plt.title("Nhiễu")
    plt.axis("off")

plt.suptitle(f"Gaussian Noise (σ = {NOISE_STD})")
plt.tight_layout()

# ========================== LƯU ẢNH GRID ==========================
grid_path = os.path.join(SAVE_DIR, "mnist_noise_grid.png")
plt.savefig(grid_path, dpi=150)
print("Đã lưu ảnh grid tại:", grid_path)

plt.close()

# ========================== LƯU ẢNH RIÊNG ==========================
for i in range(5):
    # ảnh gốc
    plt.imshow(x_test[i].reshape(28,28), cmap='gray')
    plt.axis("off")
    clean_path = os.path.join(SAVE_DIR, f"clean_{i}.png")
    plt.savefig(clean_path)
    plt.close()

    # ảnh nhiễu
    plt.imshow(x_test_noisy[i].reshape(28,28), cmap='gray')
    plt.axis("off")
    noisy_path = os.path.join(SAVE_DIR, f"noisy_{i}.png")
    plt.savefig(noisy_path)
    plt.close()

print("Đã lưu ảnh riêng vào thư mục results/")

# ========================== KIỂM TRA FILE ==========================
print("\nDanh sách file trong results/:")
print(os.listdir(SAVE_DIR))
print(os.path.abspath("results"))
print("\nHOÀN TẤT 🚀")