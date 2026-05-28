# 1. Tạo thư viện làm việc
vlib work

# 2. Biên dịch mã nguồn
vlog minterm_logic.v
vlog tb_minterm_logic.v

# 3. Tải testbench lên trình giả lập
vsim work.tb_minterm_logic

# 4. Thêm các vách ngăn (Divider) và phân nhóm các dây tín hiệu
add wave -divider "Inputs (Switches)"
add wave -color "Yellow"  sim:/tb_minterm_logic/a
add wave -color "Yellow"  sim:/tb_minterm_logic/b
add wave -color "Yellow"  sim:/tb_minterm_logic/c

add wave -divider "Outputs (LEDs)"
add wave -color "Orange"  sim:/tb_minterm_logic/f_orig
add wave -color "Cyan"    sim:/tb_minterm_logic/f_nand
add wave -color "Green"   sim:/tb_minterm_logic/f_nor

# 5. Chạy mô phỏng toàn bộ
run -all

# 6. Zoom khít đồ thị
wave zoom full
