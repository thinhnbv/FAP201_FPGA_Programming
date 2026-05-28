# 1. Tạo thư viện làm việc
vlib work

# 2. Biên dịch mã nguồn
vlog fap201_lab01.v
vlog tb_fap201_lab01.v

# 3. Tải testbench lên trình giả lập
vsim work.tb_fap201_lab01

# 4. Thêm các vách ngăn (Divider) và phân nhóm các dây tín hiệu
add wave -divider "Inputs (Switches)"
add wave -color "Yellow"  sim:/tb_fap201_lab01/SW1
add wave -color "Yellow"  sim:/tb_fap201_lab01/SW2
add wave -color "Yellow"  sim:/tb_fap201_lab01/SW3

add wave -divider "Outputs (LEDs)"
add wave -color "Orange"  sim:/tb_fap201_lab01/D1
add wave -color "Cyan"    sim:/tb_fap201_lab01/D2
add wave -color "Green"   sim:/tb_fap201_lab01/D3

# 5. Chạy mô phỏng toàn bộ
run -all

# 6. Zoom khít đồ thị
wave zoom full
