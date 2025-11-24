import numpy as np
import math

N = 256

# ---------- Q1.15 參數 ----------
Q_FRAC = 15
Q_SCALE = 1 << Q_FRAC  # 32768

def float_to_q15(x: float) -> int:
    """
    float -> Q1.15 (int16)
    模擬四捨五入 + 飽和到 [-32768, 32767]
    """
    scaled = x * Q_SCALE
    if scaled >= 0:
        q = math.floor(scaled + 0.5)
    else:
        q = math.ceil(scaled - 0.5)

    if q >  32767:
        q =  32767
    if q < -32768:
        q = -32768

    return int(q)

# ============================================================
# 1) 產生隨機 Q1.15 input（real, imag 各 256 筆）
# ============================================================
# 直接在整數範圍 [-32768, 32767] 取值
xp_real_q15 = np.random.randint(-32768, 32768, size=N, dtype=np.int16)
xp_img_q15  = np.random.randint(-32768, 32768, size=N, dtype=np.int16)

# 輸出成 16 進位 TXT：每行 "REAL IMAG"
# 負數也會用 two's complement：例如 -1 -> FFFF
with open("fft_input_q15_hex.txt", "w") as f:
    for r, im in zip(xp_real_q15, xp_img_q15):
        f.write(f"{(int(r) & 0xFFFF):04X} {(int(im) & 0xFFFF):04X}\n")

print("Wrote fft_input_q15_hex.txt")

# ============================================================
# 2) Q1.15 -> float，做 256 點 FFT，再 scale /256
# ============================================================
xr = xp_real_q15.astype(np.float64) / Q_SCALE
xi = xp_img_q15.astype(np.float64)  / Q_SCALE
x  = xr + 1j * xi

# numpy FFT：Y[k] = Σ x[n] * exp(-j*2πkn/N)
Y = np.fft.fft(x)

# 若硬體每 stage /2，8 stage 總共 /256，這裡就除以 N
Y = Y / N

# ============================================================
# 3) float FFT 結果 -> Q1.15，做飽和
# ============================================================
Y_real_q15 = np.empty(N, dtype=np.int16)
Y_img_q15  = np.empty(N, dtype=np.int16)

for k in range(N):
    Y_real_q15[k] = float_to_q15(Y[k].real)
    Y_img_q15[k]  = float_to_q15(Y[k].imag)

# ============================================================
# 4) 輸出 golden FFT 結果為 16 進位 TXT
#    每行 "REAL IMAG"，4 位 hex（two's complement）
# ============================================================
with open("fft_output_q15_hex.txt", "w") as f:
    for r, im in zip(Y_real_q15, Y_img_q15):
        f.write(f"{(int(r) & 0xFFFF):04X} {(int(im) & 0xFFFF):04X}\n")

print("Wrote fft_output_q15_hex.txt")
