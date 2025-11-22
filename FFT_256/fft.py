'''
for i in range(0, 256, 16):
    line = ", ".join(f"x{k}_img" for k in range(i, i + 16))
    print("    " + line + ",")

for k in range(256):
    print(f"output signed [15:0] y{k}_real;")
    print(f"output signed [15:0] y{k}_img;")


import math

N = 256
for k in range(N//2):
    c = math.cos(2*math.pi*k/N)
    s = -math.sin(2*math.pi*k/N)
    w_real = int(round(c * (1<<15))) & 0xFFFF
    w_imag = int(round(s * (1<<15))) & 0xFFFF
    print(f"assign w_real[{k}] = 16'h{w_real:04x}; // {c:.4f}")
    print(f"assign w_imag[{k}] = 16'h{w_imag:04x}; // {s:.4f}")
'''
'''
for k in range (256):
    print(f"reg signed [15:0] xp_real_fly_reg{k}, xp_img_fly_reg{k}, xq_real_fly_reg{k}, xq_img_fly_reg{k};")

for i in range(0, 256, 64):
    names = ", ".join(f"w{k}_img" for k in range(i, i + 64))
    print(f"wire {names};")
'''
line = "butterfly B2 (.xp_real(b2_xp_real), .xp_img(b2_xp_img), .xq_real(b2_xq_real), .xq_img(b2_xq_img), .w_real(b2_wreal), .w_img(b2_img), .yp_real(b2_ypreal), .yp_img(b2_ypimg), .yq_real(b2_yqreal), .yq_img(b2_yqimg));"

# 把所有的 "2" 換成 "3"
for k in range(32,64):
    line_new = line.replace("2", str(k))
    print(line_new)
'''
bases = [
    0, 5, 10, 15, 20, 25, 30, 35,
    40, 45, 50, 55, 60, 65, 70, 75,
    80, 85, 90, 95, 100, 105, 110, 115,
    120, 125, 130, 135, 140, 145, 150, 155
]

print("        for (integer i = 0 ; i < 4 ; i++) begin")
for b in bases:
    if b == 0:
        left_idx  = "i"
        right_idx = "i+1"
    else:
        left_idx  = f"{b} + i"
        right_idx = f"{b+1} + i"   # 右邊 = 左邊 + 1
    print(f"            st5_real[{left_idx}] <= st5_real[{right_idx}];")
    print(f"            st5_img[{left_idx}]  <= st5_img[{right_idx}];")
print("        end")
'''
def bit_reverse(x, bits):
    return int('{:0{b}b}'.format(x, b=bits)[::-1], 2)

start_b = 32
end_b = 63

N = 256
stage = 6
L = 2 ** stage
step = N // L      # = 4
bits = 5           # 32 butterflies → index: 0..31

print("always @(*) begin")
print("    if (cnt > 257 && cnt < 262) begin")

for b in range(start_b, end_b + 1):
    i = b - start_b
    xp_idx = 5 * i
    xq_idx = xp_idx + 4
    w_idx = bit_reverse(i, bits) * step

    print(f"        b{b}_xp_real = st5_real[{xp_idx}];")
    print(f"        b{b}_xp_img  = st5_img[{xp_idx}];")
    print(f"        b{b}_xq_real = st5_real[{xq_idx}];")
    print(f"        b{b}_xq_img  = st5_img[{xq_idx}];")
    print(f"        b{b}_wreal   = w_real[{w_idx}];")
    print(f"        b{b}_wimg    = w_img[{w_idx}];")
    print("")

print("    end")
print("end")

print("always @(*) begin")
print("    if (cnt > 257 && cnt < 262) begin")

'''
N = 256  # FFT points

for s in range(1, 9):   # stage 1..8
    L = 2 ** s
    step = N // L       # N/L
    m_max = L // 2

    ks = [m * step for m in range(m_max)]

    print(f"Stage {s}: L={L}, step={step}, num_twiddle={m_max}")
    print("  w index =", ks)
    print()
'''
st_idx_real = [
    3, 7, 11, 15, 19, 23,
    34, 39, 44, 49, 54, 59,
    64, 69, 74, 79, 84, 89,
    94, 99, 104, 109, 114, 119,
    124, 129, 134, 139, 144, 149,
    154, 159,
]

print("always @(posedge clk) begin")
print("    if (cnt > 257 && cnt < 262) begin")

for k, idx in enumerate(st_idx_real):
    b = 32 + k   # b32 ~ b63
    # 假設你是：偶數 index 進 yp，奇數 index 進 yq（可以依你自己的規則改）
    suffix = "yp" if (k % 2 == 0) else "yq"

    print(f"        st6_real[{idx}] <= b{b}_{suffix}real;")
    print(f"        st6_img [{idx}] <= b{b}_{suffix}img;")

print("        // 下面接 shift 的 for 迴圈")
print("    end")
print("end")

