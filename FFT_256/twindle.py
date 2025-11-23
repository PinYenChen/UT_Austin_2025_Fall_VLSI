import math
import cmath

def bit_reverse(x: int, bits: int) -> int:
    """Reverse lowest 'bits' bits of x."""
    r = 0
    for i in range(bits):
        r = (r << 1) | ((x >> i) & 1)
    return r

def dump_fft_twiddle_dit(
    N=256,
    twiddle_schedule_file="fft256_twiddle_custom.txt",
    twiddle_table_file="fft256_W_table.txt",
):
    """
    Radix-2 DIT FFT twiddle schedule
    - stage 編號 s = 0..log2(N)-1（從左到右）
    - 在同一個 stage 中，butterfly 是照你說的「從上到下」排序。
    """

    num_stages = int(math.log2(N))

    # 1) 產生 W[k] table: W[k] = exp(-j*2*pi*k/N)
    W = [cmath.exp(-2j * math.pi * k / N) for k in range(N)]

    with open(twiddle_table_file, "w") as fw:
        fw.write(f"# W[k] = exp(-j*2*pi*k/{N})\n")
        fw.write("# k, Re(W[k]), Im(W[k])\n")
        for k, w in enumerate(W):
            fw.write(f"{k:3d}, {w.real:+.15f}, {w.imag:+.15f}\n")

    # 2) 產生每一層 twiddle 使用表
    with open(twiddle_schedule_file, "w") as f:
        f.write("# Radix-2 DIT FFT twiddle schedule\n")
        f.write("# Fields: stage, order_in_stage, top_idx, bot_idx, twiddle_idx\n\n")

        for s in range(num_stages):
            diff = N >> (s + 1)         # 上下 index 差
            group_size = 2 * diff
            num_groups = N // group_size

            f.write(f"## Stage {s}  (diff={diff}, group_size={group_size}, "
                    f"num_groups={num_groups})\n")

            order_in_stage = 0

            # 先跑 group（從上到下），每一個 group 的 twiddle 固定
            for g in range(num_groups):
                # 這一群使用的 twiddle index
                tw_idx = diff * bit_reverse(g, s) if s > 0 else 0

                for k in range(diff):
                    top = g * group_size + k
                    bot = top + diff

                    f.write(
                        f"{s:02d}, {order_in_stage:03d}, "
                        f"{top:03d}, {bot:03d}, {tw_idx:03d}\n"
                    )
                    order_in_stage += 1

            f.write("\n")

    print("Done!")
    print(f"Twiddle schedule -> {twiddle_schedule_file}")
    print(f"W table          -> {twiddle_table_file}")


if __name__ == "__main__":
    # 你要 256 點就用這行
    dump_fft_twiddle_dit(N=256)

    # 如果想驗證 8-點的 pattern，改成：
    dump_fft_twiddle_dit(N=8,
         twiddle_schedule_file="fft8_twiddle_custom.txt",
         twiddle_table_file="fft8_W_table.txt")
