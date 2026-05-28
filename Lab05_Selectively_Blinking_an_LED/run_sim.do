# 1. Tạo thư viện làm việc
vlib work

# 2. Biên dịch mã nguồn
vlog demux_1to4.v
vlog lfsr_nbit.v
vlog fap201_lab05.v
vlog tb_fap201_lab05.v

# 3. Tải testbench lên trình giả lập
vsim work.tb_fap201_lab05

# 4. Thêm các vách ngăn (Divider) và phân nhóm các dây tín hiệu
add wave -divider "System Clock & Reset"
add wave -color "Cyan"    sim:/tb_fap201_lab05/clk
add wave -color "White"   sim:/tb_fap201_lab05/rst_n

add wave -divider "LED Select Switches"
add wave -color "Yellow"  sim:/tb_fap201_lab05/SW1
add wave -color "Yellow"  sim:/tb_fap201_lab05/SW2

add wave -divider "Internal Counters & Flags"
add wave -color "Green"   sim:/tb_fap201_lab05/uut/lfsr_inst/r_lfsr
add wave -color "Violet"  sim:/tb_fap201_lab05/uut/w_lfsr_done
add wave -color "Pink"    sim:/tb_fap201_lab05/uut/r_toggle

add wave -divider "Output LEDs"
add wave -color "Orange"  sim:/tb_fap201_lab05/led1
add wave -color "Cyan"    sim:/tb_fap201_lab05/led2
add wave -color "Green"   sim:/tb_fap201_lab05/led3
add wave -color "White"   sim:/tb_fap201_lab05/led4

# 5. Chạy mô phỏng toàn bộ
run -all

# 6. Zoom khít đồ thị
wave zoom full
