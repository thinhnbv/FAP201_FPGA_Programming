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

### 🔹 Extra Assignment: Combinational Logic Gates
* **Objective:** Implement custom boolean logic functions to process 3 inputs (`A`, `B`, `C`) into 3 specific outputs (`X`, `Y`, `Z`) using combinational gate representations.
* **Source Files:**
  * `sw_led_logic.v` - Standard module defining boolean expressions for `X`, `Y`, and `Z` outputs via continuous assignments.
  * `tb_sw_led_logic.v` - Verification testbench that prints a complete formatted Truth Table directly to the simulation console using `$display` tasks.
---

## 🚀 Future Updates
*(New laboratory exercises, state machine designs, and project assignments will be added sequentially to this repository as the semester progresses.)*