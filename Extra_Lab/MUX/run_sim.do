# Create work library
vlib work

# Compile Verilog files
vlog mux.v
vlog tb_mux.v

# Load the testbench
vsim work.tb_mux

# Add all waves in the testbench
add wave -position insertpoint sim:/tb_mux/*

# Run simulation
run -all

# Zoom to fit waveform window
wave zoom full
