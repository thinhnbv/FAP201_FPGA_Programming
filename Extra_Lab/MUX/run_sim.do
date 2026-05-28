# 1. Tạo thư viện làm việc
vlib work

# 2. Biên dịch mã nguồn
vlog mux.v
vlog tb_mux.v

# 3. Tải testbench lên trình giả lập
vsim work.tb_mux

# 4. Thêm các vách ngăn (Divider) và phân nhóm các dây tín hiệu
add wave -divider "MUX 2:1 Signals"
add wave -color "Yellow"  sim:/tb_mux/a2 sim:/tb_mux/b2 sim:/tb_mux/s2
add wave -color "Orange"  sim:/tb_mux/y2_gate sim:/tb_mux/y2_dataflow

add wave -divider "MUX 4:1 Signals"
add wave -color "Cyan"    sim:/tb_mux/a4 sim:/tb_mux/b4 sim:/tb_mux/c4 sim:/tb_mux/d4 sim:/tb_mux/s4
add wave -color "Green"   sim:/tb_mux/y4_structural sim:/tb_mux/y4_behavioral

add wave -divider "MUX 8:1 Signals"
add wave -color "Violet"  sim:/tb_mux/d8 sim:/tb_mux/s8
add wave -color "Pink"    sim:/tb_mux/y8_structural

add wave -divider "Parameterized MUX"
add wave -color "White"   sim:/tb_mux/param_a sim:/tb_mux/param_b sim:/tb_mux/param_s
add wave -color "Blue"    sim:/tb_mux/param_y

# 5. Chạy mô phỏng toàn bộ
run -all

# 6. Zoom khít đồ thị
wave zoom full
