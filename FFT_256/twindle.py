import math
import cmath

N = 256
NUM_STAGES = int(math.log2(N))

twiddle_schedule_file = "fft256_twiddle_DIT.txt"
twiddle_table_file    = "fft256_W_table.txt"

# ------------------------------------------------------------
# 1) 產生 W[k] table: W[k] = exp(-j*2*pi*k/N)
# ------------------------------------------------------------
W = [cmath.exp(-2j * math.pi * k / N) for k in range(N)]

with open(twiddle_table_file, "w") as fw:
    fw.write("# 256-point FFT twiddle table W[k] = exp(-j*2*pi*k/256)\n")
    fw.write("# k,  Re{W[k]},  Im{W[k]}\n\n")
    for k, w in enumerate(W):
        fw.write(f"{k:3d}, {w.real:+.15f}, {w.imag:+.15f}\n")

# ------------------------------------------------------------
# 2) 產生 radix-2 DIT FFT 的 twiddle 使用表
#
# DIT，stage 從 0 開始（最左邊那層）：
#   m           = 2^(stage+1)   # 這一層每個 group 的長度
#   half        = m / 2
#   stride      = N / m
#   group 起點 j = 0, m, 2m, ...
#   group 內第 k 個 butterfly:
#       top  index = j + k
#       bottom index = j + k + half
#       twiddle index = stride * k
#
# 注意：stage 0 => m=2, stride=N/2=128，但 k 只有 0
#       所以所有 twiddle index = 0  (W[0])，符合你圖上「第一層都是 W^0_N」。
# ------------------------------------------------------------
with open(twiddle_schedule_file, "w") as f:
    f.write("# 256-point radix-2 DIT FFT twiddle schedule\n")
    f.write("# Fields: stage, local_bfly, top_idx, bottom_idx, twiddle_idx\n\n")

    for stage in range(NUM_STAGES):
        m = 2 ** (stage + 1)
        half = m // 2
        stride = N // m

        f.write(f"## Stage {stage}  (m={m}, half={half}, stride={stride})\n")
        local_bfly = 0

        for group_start in range(0, N, m):
            for k in range(half):
                top = group_start + k
                bot = group_start + k + half
                tw_idx = stride * k   # 這個 butterfly 要用的 W index

                f.write(f"{stage:02d}, {local_bfly:03d}, "
                        f"{top:03d}, {bot:03d}, {tw_idx:03d}\n")
                local_bfly += 1

        f.write("\n")

print("Done!")
print(f"Twiddle schedule -> {twiddle_schedule_file}")
print(f"W table          -> {twiddle_table_file}")
