# 1. Tạo thư viện làm việc
vlib work

# 2. Biên dịch tất cả mã nguồn
vlog debounce_filter.v
vlog led_toggle.v
vlog fap201_lab04.v
vlog tb_fap201_lab04.v

# 3. Tải testbench lên trình giả lập
vsim work.tb_fap201_lab04

# 4. Thêm các vách ngăn (Divider) và phân nhóm các dây tín hiệu
add wave -divider "System Signals"
add wave -color "Cyan"    sim:/tb_fap201_lab04/r_clk
add wave -color "Yellow"  sim:/tb_fap201_lab04/r_SW1
add wave -color "Orange"  sim:/tb_fap201_lab04/w_D1

add wave -divider "Internal Debounce Signals"
add wave -color "Green"   sim:/tb_fap201_lab04/uut_system/debounce_inst/r_state
add wave -color "White"   sim:/tb_fap201_lab04/uut_system/debounce_inst/r_count

# 5. Chạy mô phỏng toàn bộ
run -all

# 6. Zoom khít đồ thị
wave zoom full
