# 1. Tạo thư viện làm việc
vlib work

# 2. Biên dịch mã nguồn
vlog fap201_lab03.v
vlog tb_fap201_lab03.v

# 3. Tải testbench lên trình giả lập
vsim work.tb_fap201_lab03

# 4. Thêm các vách ngăn (Divider) và phân nhóm các dây tín hiệu
add wave -divider "Clock Signal"
add wave -color "Cyan"    sim:/tb_fap201_lab03/clk

add wave -divider "Inputs (Switches)"
add wave -color "Yellow"  sim:/tb_fap201_lab03/SW1

add wave -divider "Outputs (LED)"
add wave -color "Orange"  sim:/tb_fap201_lab03/D1

# 5. Chạy mô phỏng toàn bộ
run -all

# 6. Zoom khít đồ thị
wave zoom full
