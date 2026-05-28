# 1. Tạo thư viện làm việc
vlib work

# 2. Biên dịch mã nguồn
vlog sw_led_logic.v
vlog tb_sw_led_logic.v

# 3. Tải testbench lên trình giả lập
vsim work.tb_sw_led_logic

# 4. Thêm các vách ngăn (Divider) và phân nhóm các dây tín hiệu
add wave -divider "Inputs (Switches)"
add wave -color "Yellow"  sim:/tb_sw_led_logic/A
add wave -color "Yellow"  sim:/tb_sw_led_logic/B
add wave -color "Yellow"  sim:/tb_sw_led_logic/C

add wave -divider "Outputs (LEDs)"
add wave -color "Orange"  sim:/tb_sw_led_logic/X
add wave -color "Cyan"    sim:/tb_sw_led_logic/Y
add wave -color "Green"   sim:/tb_sw_led_logic/Z

# 5. Chạy mô phỏng toàn bộ
run -all

# 6. Zoom khít đồ thị
wave zoom full
