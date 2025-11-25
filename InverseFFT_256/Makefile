# Makefile

VCS       = vcs
VCS_FLAGS = -full64 -sverilog -debug

# 如果你是用 cmd_fl 列檔案，就用這個
VCS_CMD   = $(VCS) $(VCS_FLAGS) -f cmd_fl

# 預設目標：編譯 + 跑模擬
all: run

# 編譯出 simv
simv:
	$(VCS_CMD) -l compile.log

# 跑模擬
run: simv
	./simv +vcs+lic+wait -l sim.log

wv: simv
	./simv -gui &
 
# 清除檔案
clean:
	rm -rf simv simv.daidir csrc *.log ucli.key *.vpd *.vcd