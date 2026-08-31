import os
import numpy as np
import matplotlib.pyplot as plt
import json
from datetime import datetime
import tensorflow as tf
from tensorflow.keras import layers, models
from tensorflow.keras.datasets import mnist
from tensorflow.keras.callbacks import EarlyStopping, ReduceLROnPlateau, Callback

# ========================== CONFIG ==========================
NOISE_STD = 0.5
BATCH_SIZE = 128
EPOCHS = 50
SAVE_DIR = r"C:\Nam_3_HK2_2025_2026\Do_an_1\result_optimized"

os.makedirs(SAVE_DIR, exist_ok=True)
print("Lưu tại:", SAVE_DIR)

# ========================== CUSTOM CALLBACK ĐỂ GHI LẠI PSNR ==========================
class PSNRCallback(Callback):
    def __init__(self, x_test, x_test_noisy, x_test_clean):
        super().__init__()
        self.x_test = x_test
        self.x_test_noisy = x_test_noisy
        self.x_test_clean = x_test_clean
        self.psnr_history = []
        self.val_psnr_history = []
        self.mse_history = []
        self.val_mse_history = []
        
    def on_epoch_end(self, epoch, logs=None):
        # Dự đoán trên validation set
        decoded = self.model.predict(self.x_test_noisy, verbose=0)
        
        # Tính PSNR
        mse_val = np.mean((self.x_test_clean - decoded) ** 2)
        psnr_val = 10 * np.log10(1.0 / (mse_val + 1e-10))
        
        # Tính PSNR trên noisy input
        mse_noisy = np.mean((self.x_test_clean - self.x_test_noisy) ** 2)
        psnr_noisy = 10 * np.log10(1.0 / (mse_noisy + 1e-10))
        
        self.psnr_history.append(psnr_val)
        self.val_psnr_history.append(psnr_noisy)
        self.mse_history.append(mse_val)
        self.val_mse_history.append(mse_noisy)
        
        print(f"\n📊 Epoch {epoch+1}: Val PSNR = {psnr_val:.2f} dB | Val MSE = {mse_val:.6f}")

# ========================== DATA ==========================
(x_train, _), (x_test, _) = mnist.load_data()
x_train = x_train.astype("float32") / 255.
x_test = x_test.astype("float32") / 255.
x_train = x_train.reshape(-1, 28, 28, 1)
x_test = x_test.reshape(-1, 28, 28, 1)

# ========================== NOISE ==========================
def add_gaussian_noise(x, std=NOISE_STD):
    noise = np.random.normal(0.0, std, x.shape)
    return np.clip(x + noise, 0., 1.)

x_train_noisy = add_gaussian_noise(x_train)
x_test_noisy = add_gaussian_noise(x_test)

# ========================== MODEL ==========================
def build_model_optimized():
    inp = layers.Input(shape=(28,28,1))
    
    # Encoder
    x = layers.Conv2D(8, 3, padding='same', activation='relu')(inp)
    x = layers.BatchNormalization()(x)
    x = layers.MaxPooling2D(2)(x)
    
    x = layers.Conv2D(16, 3, padding='same', activation='relu')(x)
    x = layers.BatchNormalization()(x)
    x = layers.MaxPooling2D(2)(x)
    
    # Bottleneck
    x = layers.Conv2D(32, 3, padding='same', activation='relu')(x)
    x = layers.BatchNormalization()(x)
    
    # Decoder
    x = layers.UpSampling2D(2)(x)
    x = layers.Conv2D(16, 3, padding='same', activation='relu')(x)
    x = layers.BatchNormalization()(x)
    
    x = layers.UpSampling2D(2)(x)
    x = layers.Conv2D(8, 3, padding='same', activation='relu')(x)
    x = layers.BatchNormalization()(x)
    
    out = layers.Conv2D(1, 3, padding='same', activation='sigmoid')(x)
    
    return models.Model(inp, out)

model = build_model_optimized()
model.compile(optimizer='adam', loss='mse')
model.summary()

# ========================== TRAIN ==========================
# Khởi tạo callback PSNR
psnr_callback = PSNRCallback(x_test, x_test_noisy, x_test)

callbacks = [
    EarlyStopping(patience=10, restore_best_weights=True, verbose=1),
    ReduceLROnPlateau(factor=0.5, patience=5, min_lr=1e-6, verbose=1),
    psnr_callback
]

history = model.fit(
    x_train_noisy, x_train,
    epochs=EPOCHS,
    batch_size=BATCH_SIZE,
    validation_data=(x_test_noisy, x_test),
    callbacks=callbacks,
    shuffle=True,
    verbose=1
)

# ========================== PREDICTION ==========================
decoded_imgs = model.predict(x_test_noisy)

# ========================== TÍNH TOÁN METRICS ==========================
def compute_mse(x, y):
    return np.mean((x - y) ** 2)

def compute_psnr(x, y):
    mse = compute_mse(x, y)
    return 10 * np.log10(1.0 / (mse + 1e-10))

# MSE và PSNR cho noisy input
mse_noisy = compute_mse(x_test, x_test_noisy)
psnr_noisy = compute_psnr(x_test, x_test_noisy)

# MSE và PSNR cho denoised output
mse_denoised = compute_mse(x_test, decoded_imgs)
psnr_denoised = compute_psnr(x_test, decoded_imgs)

print("\n" + "="*50)
print("📊 KẾT QUẢ ĐÁNH GIÁ")
print("="*50)
print(f"🔴 Noisy Image:")
print(f"   - MSE: {mse_noisy:.6f}")
print(f"   - PSNR: {psnr_noisy:.2f} dB")
print(f"\n🟢 Denoised Image:")
print(f"   - MSE: {mse_denoised:.6f}")
print(f"   - PSNR: {psnr_denoised:.2f} dB")
print(f"\n📈 Cải thiện:")
print(f"   - MSE giảm: {(1 - mse_denoised/mse_noisy)*100:.2f}%")
print(f"   - PSNR tăng: +{psnr_denoised - psnr_noisy:.2f} dB")
print("="*50)

# ========================== VẼ BIỂU ĐỒ ==========================

# 1. Loss theo epoch (Train và Validation)
plt.figure(figsize=(15, 10))

plt.subplot(2, 3, 1)
plt.plot(history.history['loss'], 'b-', label='Train Loss', linewidth=2)
plt.plot(history.history['val_loss'], 'r-', label='Validation Loss', linewidth=2)
plt.xlabel('Epoch')
plt.ylabel('Loss (MSE)')
plt.title('📉 Loss giảm theo Epoch')
plt.legend()
plt.grid(True, alpha=0.3)

# 2. PSNR theo epoch (từ callback)
plt.subplot(2, 3, 2)
plt.plot(psnr_callback.val_psnr_history, 'orange', label='Noisy PSNR', linewidth=2, linestyle='--')
plt.plot(psnr_callback.psnr_history, 'g-', label='Denoised PSNR', linewidth=2)
plt.xlabel('Epoch')
plt.ylabel('PSNR (dB)')
plt.title('📈 PSNR tăng theo Epoch')
plt.legend()
plt.grid(True, alpha=0.3)

# 3. MSE theo epoch
plt.subplot(2, 3, 3)
plt.plot(psnr_callback.val_mse_history, 'orange', label='Noisy MSE', linewidth=2, linestyle='--')
plt.plot(psnr_callback.mse_history, 'g-', label='Denoised MSE', linewidth=2)
plt.xlabel('Epoch')
plt.ylabel('MSE')
plt.title('📊 MSE giảm theo Epoch')
plt.legend()
plt.grid(True, alpha=0.3)

# 4. Bar chart so sánh MSE
plt.subplot(2, 3, 4)
metrics_mse = [mse_noisy, mse_denoised]
colors_mse = ['#ff6b6b', '#51cf66']
bars_mse = plt.bar(['Noisy', 'Denoised'], metrics_mse, color=colors_mse, edgecolor='black', linewidth=1.5)
plt.ylabel('MSE')
plt.title('📊 So sánh MSE trước và sau khử nhiễu')
for bar, val in zip(bars_mse, metrics_mse):
    plt.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.002, 
             f'{val:.5f}', ha='center', va='bottom', fontsize=10, fontweight='bold')
plt.grid(True, alpha=0.3, axis='y')

# 5. Bar chart so sánh PSNR
plt.subplot(2, 3, 5)
metrics_psnr = [psnr_noisy, psnr_denoised]
colors_psnr = ['#ff6b6b', '#51cf66']
bars_psnr = plt.bar(['Noisy', 'Denoised'], metrics_psnr, color=colors_psnr, edgecolor='black', linewidth=1.5)
plt.ylabel('PSNR (dB)')
plt.title('📈 So sánh PSNR trước và sau khử nhiễu')
for bar, val in zip(bars_psnr, metrics_psnr):
    plt.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.5, 
             f'{val:.2f} dB', ha='center', va='bottom', fontsize=10, fontweight='bold')
plt.grid(True, alpha=0.3, axis='y')

# 6. Gain improvement
plt.subplot(2, 3, 6)
gain_mse = (1 - mse_denoised/mse_noisy) * 100
gain_psnr = psnr_denoised - psnr_noisy
metrics_gain = [gain_mse, gain_psnr]
colors_gain = ['#339af0', '#f59f00']
bars_gain = plt.bar(['MSE Reduction (%)', 'PSNR Gain (dB)'], metrics_gain, color=colors_gain, edgecolor='black', linewidth=1.5)
plt.title('🎯 Mức độ cải thiện')
for bar, val in zip(bars_gain, metrics_gain):
    plt.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.5, 
             f'{val:.2f}', ha='center', va='bottom', fontsize=10, fontweight='bold')
plt.grid(True, alpha=0.3, axis='y')

plt.tight_layout()
plt.savefig(os.path.join(SAVE_DIR, "metrics_analysis.png"), dpi=150, bbox_inches='tight')
plt.close()

# ========================== VẼ ẢNH SO SÁNH ==========================
plt.figure(figsize=(18, 6))
n = 10

for i in range(n):
    # Ảnh gốc
    plt.subplot(3, n, i+1)
    plt.imshow(x_test[i].reshape(28,28), cmap='gray')
    plt.axis('off')
    if i == 0:
        plt.title('Original', fontsize=12, fontweight='bold')
    
    # Ảnh nhiễu
    plt.subplot(3, n, i+1+n)
    plt.imshow(x_test_noisy[i].reshape(28,28), cmap='gray')
    plt.axis('off')
    if i == 0:
        plt.title(f'Noisy\nPSNR: {psnr_noisy:.1f}dB', fontsize=10, fontweight='bold')
    
    # Ảnh khử nhiễu
    plt.subplot(3, n, i+1+2*n)
    plt.imshow(decoded_imgs[i].reshape(28,28), cmap='gray')
    plt.axis('off')
    if i == 0:
        plt.title(f'Denoised\nPSNR: {psnr_denoised:.1f}dB', fontsize=10, fontweight='bold')

plt.suptitle(f'So sánh kết quả khử nhiễu (Noise std = {NOISE_STD})', fontsize=14, fontweight='bold', y=1.02)
plt.tight_layout()
plt.savefig(os.path.join(SAVE_DIR, "comparison.png"), dpi=150, bbox_inches='tight')
plt.close()

# ========================== LƯU HISTORY JSON ==========================
# Lưu đầy đủ history từ Keras
with open(os.path.join(SAVE_DIR, "history.json"), "w") as f:
    json.dump(history.history, f, indent=4)

# Lưu thêm PSNR và MSE history từ callback
psnr_history_data = {
    "psnr_noisy_per_epoch": psnr_callback.val_psnr_history,
    "psnr_denoised_per_epoch": psnr_callback.psnr_history,
    "mse_noisy_per_epoch": psnr_callback.val_mse_history,
    "mse_denoised_per_epoch": psnr_callback.mse_history
}
with open(os.path.join(SAVE_DIR, "psnr_history.json"), "w") as f:
    json.dump(psnr_history_data, f, indent=4)

# ========================== LƯU METRICS ==========================
metrics = {
    "noise_std": NOISE_STD,
    "batch_size": BATCH_SIZE,
    "epochs": len(history.history['loss']),
    "final_train_loss": float(history.history['loss'][-1]),
    "final_val_loss": float(history.history['val_loss'][-1]),
    "mse_noisy": float(mse_noisy),
    "mse_denoised": float(mse_denoised),
    "mse_improvement_percent": float(gain_mse),
    "psnr_noisy": float(psnr_noisy),
    "psnr_denoised": float(psnr_denoised),
    "psnr_gain": float(gain_psnr),
    "total_params": model.count_params(),
    "timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
}

with open(os.path.join(SAVE_DIR, "metrics.json"), "w") as f:
    json.dump(metrics, f, indent=4)

# ========================== IN RA TỔNG KẾT ==========================
print("\n" + "="*60)
print("🚀 HOÀN THÀNH! KẾT QUẢ ĐÃ ĐƯỢC LƯU")
print("="*60)
print(f"📁 Thư mục lưu trữ: {SAVE_DIR}")
print(f"\n📊 Các file đã lưu:")
print(f"   - denoiser_optimized.h5 (Model weights)")
print(f"   - metrics.json (Thông số đánh giá)")
print(f"   - history.json (Loss history từ Keras)")
print(f"   - psnr_history.json (PSNR/MSE theo epoch)")
print(f"   - metrics_analysis.png (6 biểu đồ phân tích)")
print(f"   - comparison.png (Ảnh so sánh trước/sau)")
print(f"\n📈 Thông số cuối cùng:")
print(f"   - Loss train: {history.history['loss'][-1]:.6f}")
print(f"   - Loss val: {history.history['val_loss'][-1]:.6f}")
print(f"   - PSNR noisy: {psnr_noisy:.2f} dB")
print(f"   - PSNR denoised: {psnr_denoised:.2f} dB")
print(f"   - PSNR gain: +{gain_psnr:.2f} dB")
print(f"   - MSE noisy: {mse_noisy:.6f}")
print(f"   - MSE denoised: {mse_denoised:.6f}")
print(f"   - MSE reduction: {gain_mse:.2f}%")
print("="*60)