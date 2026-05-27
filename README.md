# FPGA Programming (FAP201) - University Coursework

This repository serves as a digital archive for all laboratory assignments, practical exercises, and homework assigned by the lecturer throughout the **FPGA Programming** course at my university. 

All designs are implemented using **Verilog HDL** and configured for Gowin FPGA platforms.

---

## 🛠️ Development Environment & Hardware
* **Target Device:** Gowin GW5A-LV25UG324C2/I1
* **Software Toolchain:** Gowin EDA
* **Hardware Language:** Verilog HDL

---

## 📂 Repository Contents

### 🔹 Lab 01: Wiring Switches to LEDs
* **Objective:** Design and program a combinational logic circuit to directly map 3 physical input switches (`SW1`, `SW2`, `SW3`) to 3 corresponding output LEDs (`D1`, `D2`, `D3`) on the FPGA board.
* **Source Files:**
  * `fap201_lab01.v` - Main Verilog module implementing wire-through assignments.
  * `tb_fap201_lab01.v` - Comprehensive testbench sweeping through all 8 possible logic states (from `000` to `111`) for simulation validation.

### 🔹 Lab 02: Lighting an LED with Logic Gates
* **Objective:** Implement a basic 2-input AND gate using the FPGA's Look-up Table (LUT) architecture. The output LED (`D1`) will only illuminate when both input switches (`SW1` and `SW2`) are pressed simultaneously.
* **Source Files:**
  * `fap201_lab02.v` - Main Verilog module performing continuous assignment for boolean AND operations.
  * `tb_fap201_lab02.v` - Testbench verifying all 4 possible logic input combinations (`00`, `01`, `10`, `11`) and logging the functional Truth Table to the console.

### 🔹 Lab 03: Blinking an LED
* **Objective:** Implement a sequential logic circuit using D-Flip-Flops to monitor an edge-transition. The system toggles the state of an output LED (`D1`) only at the exact moment an active-low input switch (`SW1`) is released.
* **Source Files:**
  * `fap201_lab03.v` - Sequential module incorporating synchronous shift registers for rising-edge detection and output toggle.
  * `tb_fap201_lab03.v` - Testbench mimicking button press/release timelines with a 50MHz reference clock logic simulation.

### 🔹 Lab 04: Debouncing a Switch
* **Objective:** Implement a robust, parameterized hardware Debounce Filter following the course textbook standards. The design incorporates an asynchronous edge-detection architecture and utilizes the `$clog2` system function to automatically scale internal register bit-widths based on mechanical settling time thresholds.
* **Source Files:**
  * `debounce_filter.v` - Parameterized digital filter submodule using consecutive condition testing to suppress mechanical contact switch glitches.
  * `led_toggle.v` - Sequential control subcomponent tracking edge-state releases to flip output signals.
  * `fap201_lab04.v` - Top-level wrapper managing integration paths and establishing a real-world 5ms (~250,000 clock cycles) debouncing constraint.
  * `tb_fap201_lab04.v` - Verification testbench modifying module parameters (`defparam`) to thoroughly validate transient response filtering.

### 🔹 Extra Assignment: Combinational Logic Gates
* **Objective:** Implement custom boolean logic functions to process 3 inputs (`A`, `B`, `C`) into 3 specific outputs (`X`, `Y`, `Z`) using combinational gate representations.
* **Source Files:**
  * `sw_led_logic.v` - Standard module defining boolean expressions for `X`, `Y`, and `Z` outputs via continuous assignments.
  * `tb_sw_led_logic.v` - Verification testbench that prints a complete formatted Truth Table directly to the simulation console using `$display` tasks.

### 🔹 Extra Lab: Multiplexers (MUX)
* **Objective:** Design, implement, and verify various Multiplexer architectures (2-to-1 gate/dataflow, 4-to-1 structural/behavioral, 8-to-1 structural, and Parameterized N-bit MUX) using gate-level, dataflow, structural, and behavioral modeling styles.
* **Source Files:**
  * `Extra_Lab/MUX/mux.v` - Verilog module implementing multiple MUX variants.
  * `Extra_Lab/MUX/fap201_top_mux.v` - Top-level wrapper module for FPGA board pin mapping.
  * `Extra_Lab/MUX/tb_mux.v` - Testbench validating MUX functionalities with VCD wave output.
  * `Extra_Lab/MUX/run_sim.do` - Automated ModelSim/QuestaSim simulation script.
---

## 🚀 Future Updates
*(New laboratory exercises, state machine designs, and project assignments will be added sequentially to this repository as the semester progresses.)*