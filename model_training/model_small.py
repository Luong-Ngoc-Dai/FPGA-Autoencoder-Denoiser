import os
import numpy as np
import matplotlib.pyplot as plt
import json
from datetime import datetime
import tensorflow as tf
from tensorflow.keras import layers, models
from tensorflow.keras.datasets import mnist
from tensorflow.keras.callbacks import Callback

# ========================== CONFIG ==========================
NOISE_STD = 0.5
BATCH_SIZE = 128
EPOCHS = 50   
SAVE_DIR = r"C:\Nam_3_HK2_2025_2026\Do_an_1\result"

os.makedirs(SAVE_DIR, exist_ok=True)
os.makedirs(os.path.join(SAVE_DIR, "weights"), exist_ok=True)

print("Lưu tại:", SAVE_DIR)

# ========================== CUSTOM CALLBACK CHO PSNR ==========================
class PSNRCallback(Callback):
    """Callback để tính và lưu PSNR sau mỗi epoch"""
    def __init__(self, x_test_clean, x_test_noisy):
        super().__init__()
        self.x_test_clean = x_test_clean
        self.x_test_noisy = x_test_noisy
        self.psnr_history = []
        self.val_psnr_history = []
        
    def on_epoch_end(self, epoch, logs=None):
        # Dự đoán
        decoded = self.model.predict(self.x_test_noisy, verbose=0)
        
        # Tính PSNR
        mse_denoised = np.mean((self.x_test_clean - decoded) ** 2)
        psnr_denoised = 10 * np.log10(1.0 / (mse_denoised + 1e-10))
        
        mse_noisy = np.mean((self.x_test_clean - self.x_test_noisy) ** 2)
        psnr_noisy = 10 * np.log10(1.0 / (mse_noisy + 1e-10))
        
        self.psnr_history.append(psnr_denoised)
        self.val_psnr_history.append(psnr_noisy)
        
        print(f"  - Epoch {epoch+1}: Noisy PSNR = {psnr_noisy:.2f} dB | Denoised PSNR = {psnr_denoised:.2f} dB")

# ========================== DATA ==========================
(x_train, _), (x_test, _) = mnist.load_data()

# Normalize
x_train = x_train.astype("float32") / 255.
x_test  = x_test.astype("float32") / 255.

# reshape
x_train = x_train.reshape(-1, 28, 28, 1)
x_test  = x_test.reshape(-1, 28, 28, 1)

# ========================== NOISE ==========================
def add_gaussian_noise(x, std=NOISE_STD):
    """x̃ = x + n, với n ~ N(0, σ²) - Theo Denoising Autoencoder (Vincent 2008)"""
    noise = np.random.normal(0.0, std, x.shape)
    x_noisy = x + noise
    return np.clip(x_noisy, 0., 1.)

x_train_noisy = add_gaussian_noise(x_train)
x_test_noisy  = add_gaussian_noise(x_test)

# ========================== MODEL ==========================
def build_model():
    inp = layers.Input(shape=(28,28,1))

    # Encoder
    x = layers.Conv2D(4, 3, padding='same', activation='relu', name='conv1')(inp)
    x = layers.MaxPooling2D(2, name='pool1')(x)
    x = layers.Conv2D(8, 3, padding='same', activation='relu', name='conv2')(x)

    # Decoder
    x = layers.UpSampling2D(2, name='upsample1')(x)
    x = layers.Conv2D(4, 3, padding='same', activation='relu', name='conv3')(x)
    out = layers.Conv2D(1, 3, padding='same', activation='sigmoid', name='output')(x)

    model = models.Model(inp, out)
    return model

model = build_model()
model.compile(optimizer='adam', loss='mse')

model.summary()

# ========================== TRAIN VỚI PSNR CALLBACK ==========================
psnr_callback = PSNRCallback(x_test, x_test_noisy)

history = model.fit(
    x_train_noisy, x_train,
    epochs=EPOCHS,
    batch_size=BATCH_SIZE,
    validation_data=(x_test_noisy, x_test),
    callbacks=[psnr_callback],
    shuffle=True,
    verbose=1
)

# ========================== PREDICT ==========================
decoded_imgs = model.predict(x_test_noisy)

# ========================== METRICS ==========================
def compute_mse(x, y):
    return np.mean((x - y) ** 2)

def compute_psnr(x, y):
    mse = compute_mse(x, y)
    return 10 * np.log10(1.0 / (mse + 1e-10))

mse_noisy    = compute_mse(x_test, x_test_noisy)
mse_denoised = compute_mse(x_test, decoded_imgs)
psnr_noisy    = compute_psnr(x_test, x_test_noisy)
psnr_denoised = compute_psnr(x_test, decoded_imgs)

print("\n===== KẾT QUẢ =====")
print(f"Noisy    -> MSE: {mse_noisy:.6f}, PSNR: {psnr_noisy:.2f} dB")
print(f"Denoised -> MSE: {mse_denoised:.6f}, PSNR: {psnr_denoised:.2f} dB")

# ========================== XUẤT WEIGHTS VÀ BIASES ==========================
def export_weights_biases(model, save_dir):
    """Xuất tất cả weights và biases của model ra file CSV và JSON"""
    weights_data = {}
    
    for layer in model.layers:
        if len(layer.get_weights()) > 0:  # Layer có weights
            layer_name = layer.name
            weights = layer.get_weights()
            
            print(f"\n📦 Layer: {layer_name}")
            print(f"   Số weight tensors: {len(weights)}")
            
            layer_data = {}
            
            for i, w in enumerate(weights):
                tensor_name = "weights" if i == 0 else f"bias_{i}" if i == 1 else f"tensor_{i}"
                print(f"   - {tensor_name}.shape = {w.shape}")
                
                # Lưu dưới dạng numpy
                np.save(os.path.join(save_dir, f"{layer_name}_{tensor_name}.npy"), w)
                
                # Lưu dưới dạng CSV (dễ đọc)
                if w.ndim <= 2:  # Chỉ xuất CSV cho tensor 1D hoặc 2D
                    np.savetxt(
                        os.path.join(save_dir, f"{layer_name}_{tensor_name}.csv"), 
                        w.reshape(-1, 1) if w.ndim == 1 else w,
                        delimiter=",", 
                        fmt="%.6f"
                    )
                
                # Lưu thông tin vào dictionary
                layer_data[tensor_name] = {
                    "shape": list(w.shape),
                    "dtype": str(w.dtype),
                    "min": float(w.min()),
                    "max": float(w.max()),
                    "mean": float(w.mean()),
                    "std": float(w.std())
                }
                
                # Xuất dạng hex cho FPGA (nếu cần)
                if w.size < 1000:  # Chỉ xuất nếu không quá lớn
                    w_flat = w.flatten()
                    hex_file = os.path.join(save_dir, f"{layer_name}_{tensor_name}.hex")
                    with open(hex_file, 'w') as f:
                        for val in w_flat[:100]:  # Chỉ lấy 100 giá trị đầu
                            # Chuyển sang fixed-point 16-bit
                            val_int = np.clip(int(val * 32767), -32768, 32767)
                            f.write(f"{val_int & 0xFFFF:04X}\n")
            
            weights_data[layer_name] = layer_data
    
    # Lưu thông tin tổng hợp
    with open(os.path.join(save_dir, "weights_summary.json"), "w") as f:
        json.dump(weights_data, f, indent=4)
    
    return weights_data

# Xuất weights
print("\n" + "="*50)
print("📦 XUẤT WEIGHTS VÀ BIASES")
print("="*50)
weights_info = export_weights_biases(model, os.path.join(SAVE_DIR, "weights"))
print(f"\n✅ Đã xuất weights vào: {SAVE_DIR}/weights/")

# ========================== VẼ BIỂU ĐỒ PSNR TĂNG THEO EPOCH ==========================
fig, axes = plt.subplots(2, 2, figsize=(14, 10))

# 1. Loss curves
axes[0, 0].plot(history.history['loss'], 'b-', label='Train Loss', linewidth=2)
axes[0, 0].plot(history.history['val_loss'], 'r-', label='Val Loss', linewidth=2)
axes[0, 0].set_xlabel('Epoch')
axes[0, 0].set_ylabel('Loss (MSE)')
axes[0, 0].set_title('📉 Loss giảm theo Epoch')
axes[0, 0].legend()
axes[0, 0].grid(True, alpha=0.3)

# 2. PSNR tăng theo epoch (QUAN TRỌNG)
axes[0, 1].plot(psnr_callback.val_psnr_history, 'orange', label='Noisy PSNR', linewidth=2, linestyle='--', marker='o', markersize=4)
axes[0, 1].plot(psnr_callback.psnr_history, 'g-', label='Denoised PSNR', linewidth=2, marker='s', markersize=4)
axes[0, 1].set_xlabel('Epoch')
axes[0, 1].set_ylabel('PSNR (dB)')
axes[0, 1].set_title('📈 PSNR tăng theo Epoch')
axes[0, 1].legend()
axes[0, 1].grid(True, alpha=0.3)

# Thêm chú thích giá trị cuối cùng
axes[0, 1].annotate(f'Final: {psnr_callback.psnr_history[-1]:.2f} dB', 
                    xy=(len(psnr_callback.psnr_history)-1, psnr_callback.psnr_history[-1]),
                    xytext=(len(psnr_callback.psnr_history)-10, psnr_callback.psnr_history[-1] + 2),
                    arrowprops=dict(arrowstyle='->', color='green'),
                    fontsize=10, fontweight='bold')

# 3. Bar chart so sánh PSNR
axes[1, 0].bar(['Noisy', 'Denoised'], [psnr_noisy, psnr_denoised], 
               color=['#ff6b6b', '#51cf66'], edgecolor='black', linewidth=1.5)
axes[1, 0].set_ylabel('PSNR (dB)')
axes[1, 0].set_title('📊 So sánh PSNR trước và sau khử nhiễu')
for i, (bar, val) in enumerate(zip(axes[1, 0].patches, [psnr_noisy, psnr_denoised])):
    axes[1, 0].text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.5, 
                    f'{val:.2f} dB', ha='center', fontweight='bold')
axes[1, 0].grid(True, alpha=0.3, axis='y')

# 4. Cải thiện PSNR qua các epoch (PSNR gain)
psnr_gain_history = [psnr_callback.psnr_history[i] - psnr_callback.val_psnr_history[i] 
                      for i in range(len(psnr_callback.psnr_history))]
axes[1, 1].plot(psnr_gain_history, 'purple', linewidth=2, marker='^', markersize=4)
axes[1, 1].set_xlabel('Epoch')
axes[1, 1].set_ylabel('PSNR Gain (dB)')
axes[1, 1].set_title('🎯 PSNR Gain theo Epoch')
axes[1, 1].grid(True, alpha=0.3)
axes[1, 1].fill_between(range(len(psnr_gain_history)), 0, psnr_gain_history, alpha=0.3, color='purple')

plt.tight_layout()
plt.savefig(os.path.join(SAVE_DIR, "psnr_analysis.png"), dpi=150, bbox_inches='tight')
plt.close()

# ========================== VẼ BIỂU ĐỒ PSNR RIÊNG (Dạng đường) ==========================
plt.figure(figsize=(12, 6))
plt.plot(psnr_callback.val_psnr_history, 'orange', label='Noisy PSNR', linewidth=2, linestyle='--', marker='o')
plt.plot(psnr_callback.psnr_history, 'green', label='Denoised PSNR', linewidth=2, marker='s')
plt.xlabel('Epoch', fontsize=12)
plt.ylabel('PSNR (dB)', fontsize=12)
plt.title(f'PSNR theo Epoch (Noise σ={NOISE_STD})', fontsize=14, fontweight='bold')
plt.legend(fontsize=11)
plt.grid(True, alpha=0.3)

# Đánh dấu điểm tốt nhất
best_epoch = np.argmax(psnr_callback.psnr_history)
best_psnr = psnr_callback.psnr_history[best_epoch]
plt.scatter(best_epoch, best_psnr, color='red', s=100, zorder=5)
plt.annotate(f'Best: {best_psnr:.2f} dB\nEpoch {best_epoch+1}', 
             xy=(best_epoch, best_psnr),
             xytext=(best_epoch + 5, best_psnr - 2),
             arrowprops=dict(arrowstyle='->', color='red'),
             fontsize=10, fontweight='bold')

plt.tight_layout()
plt.savefig(os.path.join(SAVE_DIR, "psnr_curve.png"), dpi=150, bbox_inches='tight')
plt.close()

# ========================== SAVE MODEL ==========================
model.save(os.path.join(SAVE_DIR, "denoiser.h5"))
model.save_weights(os.path.join(SAVE_DIR, "denoiser_weights.weights.h5"))

# ========================== SAVE METRICS ==========================
metrics = {
    "noise_std": NOISE_STD,
    "epochs": EPOCHS,
    "batch_size": BATCH_SIZE,
    "mse_noisy": float(mse_noisy),
    "mse_denoised": float(mse_denoised),
    "psnr_noisy": float(psnr_noisy),
    "psnr_denoised": float(psnr_denoised),
    "psnr_gain": float(psnr_denoised - psnr_noisy),
    "best_psnr": float(best_psnr),
    "best_epoch": int(best_epoch + 1),
    "psnr_history": [float(p) for p in psnr_callback.psnr_history],
    "psnr_gain_history": [float(g) for g in psnr_gain_history],
    "timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
}

with open(os.path.join(SAVE_DIR, "metrics.json"), "w") as f:
    json.dump(metrics, f, indent=4)

# ========================== SAVE HISTORY ==========================
with open(os.path.join(SAVE_DIR, "history.json"), "w") as f:
    json.dump(history.history, f, indent=4)

# ========================== SAVE PSNR HISTORY RIÊNG ==========================
psnr_data = {
    "noisy_psnr_per_epoch": [float(p) for p in psnr_callback.val_psnr_history],
    "denoised_psnr_per_epoch": [float(p) for p in psnr_callback.psnr_history],
    "psnr_gain_per_epoch": [float(g) for g in psnr_gain_history]
}

with open(os.path.join(SAVE_DIR, "psnr_history.json"), "w") as f:
    json.dump(psnr_data, f, indent=4)

# ========================== PLOT LOSS ==========================
plt.figure(figsize=(10, 5))
plt.plot(history.history['loss'], 'b-', label='Train Loss', linewidth=2)
plt.plot(history.history['val_loss'], 'r-', label='Val Loss', linewidth=2)
plt.xlabel('Epoch')
plt.ylabel('Loss (MSE)')
plt.title('Loss theo Epoch')
plt.legend()
plt.grid(True, alpha=0.3)
plt.savefig(os.path.join(SAVE_DIR, "loss_curve.png"), dpi=150)
plt.close()

# ========================== SAVE IMAGE COMPARISON ==========================
n = 10
plt.figure(figsize=(15, 5))

for i in range(n):
    # clean
    plt.subplot(3, n, i+1)
    plt.imshow(x_test[i].reshape(28,28), cmap='gray')
    plt.axis("off")
    if i == 0: plt.title('Original', fontsize=12, fontweight='bold')

    # noisy
    plt.subplot(3, n, i+1+n)
    plt.imshow(x_test_noisy[i].reshape(28,28), cmap='gray')
    plt.axis("off")
    if i == 0: plt.title(f'Noisy\nPSNR: {psnr_noisy:.1f}dB', fontsize=10)

    # output
    plt.subplot(3, n, i+1+2*n)
    plt.imshow(decoded_imgs[i].reshape(28,28), cmap='gray')
    plt.axis("off")
    if i == 0: plt.title(f'Denoised\nPSNR: {psnr_denoised:.1f}dB', fontsize=10)

plt.suptitle(f'So sánh kết quả khử nhiễu (Noise σ={NOISE_STD})', fontsize=14, fontweight='bold')
plt.tight_layout()
plt.savefig(os.path.join(SAVE_DIR, "comparison.png"), dpi=150)
plt.close()

# ========================== IN TỔNG KẾT ==========================
print("\n" + "="*60)
print("🎉 HOÀN THÀNH! KẾT QUẢ ĐÃ ĐƯỢC LƯU")
print("="*60)
print(f"📁 Thư mục: {SAVE_DIR}")
print(f"\n📊 Các file đã lưu:")
print(f"   - denoiser.h5              (Full model)")
print(f"   - denoiser_weights.h5      (Model weights)")
print(f"   - metrics.json             (Metrics tổng hợp)")
print(f"   - history.json             (Loss history)")
print(f"   - psnr_history.json        (PSNR theo epoch)")
print(f"   - loss_curve.png           (Biểu đồ loss)")
print(f"   - psnr_curve.png           (Biểu đồ PSNR)")
print(f"   - psnr_analysis.png        (Phân tích PSNR đa chiều)")
print(f"   - comparison.png           (Ảnh so sánh)")
print(f"\n📦 Weights và Biases (thư mục weights/):")
print(f"   - *.npy                    (Numpy format)")
print(f"   - *.csv                    (CSV format)")
print(f"   - *.hex                    (Hex format cho FPGA)")
print(f"   - weights_summary.json     (Thống kê weights)")
print(f"\n📈 Thông số cuối cùng:")
print(f"   - Train Loss: {history.history['loss'][-1]:.6f}")
print(f"   - Val Loss: {history.history['val_loss'][-1]:.6f}")
print(f"   - Noisy PSNR: {psnr_noisy:.2f} dB")
print(f"   - Denoised PSNR: {psnr_denoised:.2f} dB")
print(f"   - Best PSNR: {best_psnr:.2f} dB (Epoch {best_epoch+1})")
print(f"   - PSNR Gain: +{psnr_denoised - psnr_noisy:.2f} dB")
print("="*60)

# ========================== HIỂN THỊ THÔNG TIN WEIGHTS ==========================
print("\n📊 THỐNG KÊ WEIGHTS THEO LAYER:")
print("-" * 60)
for layer_name, layer_data in weights_info.items():
    print(f"\n🔷 {layer_name}:")
    for tensor_name, stats in layer_data.items():
        print(f"   └─ {tensor_name}: shape={stats['shape']}, "
              f"range=[{stats['min']:.4f}, {stats['max']:.4f}], "
              f"mean={stats['mean']:.4f}, std={stats['std']:.4f}")