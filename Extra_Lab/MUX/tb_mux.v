`timescale 1ns/1ps

module tb_mux;

    // Signals for MUX 2-1 Gate Level & Data Flow
    reg a2, b2, s2;
    wire y2_gate;
    wire y2_dataflow;

    // Signals for MUX 4-1 Structural & Behavioral
    reg a4, b4, c4, d4;
    reg [1:0] s4;
    wire y4_structural;
    wire y4_behavioral;

    // Signals for MUX 8-1 Structural
    reg [7:0] d8;
    reg [2:0] s8;
    wire y8_structural;

    // For loop variable
    integer i;

    mux_2to1_gate uut_mux2_gate (
        .a(a2),
        .b(b2),
        .s(s2),
        .y(y2_gate)
    );

    // Signals for Parameterized MUX 2-1
    parameter TEST_WIDTH = 4;
    reg [TEST_WIDTH-1:0] param_a;
    reg [TEST_WIDTH-1:0] param_b;
    reg param_s;
    wire [TEST_WIDTH-1:0] param_y;

    // Instances
    mux_2to1 uut_mux2_dataflow (
        .a(a2),
        .b(b2),
        .s(s2),
        .y(y2_dataflow)
    );

    mux_4to1_structural uut_mux4_structural (
        .a(a4),
        .b(b4),
        .c(c4),
        .d(d4),
        .s(s4),
        .y(y4_structural)
    );

    mux_4to1 uut_mux4_behavioral (
        .a(a4),
        .b(b4),
        .c(c4),
        .d(d4),
        .s(s4),
        .y(y4_behavioral)
    );

    mux_8to1_structural uut_mux8_structural (
        .d(d8),
        .s(s8),
        .y(y8_structural)
    );

    param_mux_2to1 #(
        .WIDTH(TEST_WIDTH)
    ) uut_param_mux2 (
        .a(param_a),
        .b(param_b),
        .s(param_s),
        .y(param_y)
    );

    // TESTBENCH START
    initial begin
        // Testbench for MUX 2:1 Gate Level & Data Flow
        $display("====================================");
        $display("   TESTBENCH MUX 2:1                ");
        $display("====================================");
        $display("Time\t   A  B  S | Y_Gate    Y_DF");
        $display("------------------------------------");

        // Case 1: s2 = 0, a = 0, b = 1 => y = 0
        a2 = 1'b0; b2 = 1'b1; s2 = 1'b0;
        #10;
        $display("%0dns\t %b %b %b | %b    %b", $time, a2, b2, s2, y2_gate, y2_dataflow);

        // Case 2: s2 = 1, a = 0, b = 1 => y = 1
        a2 = 1'b0; b2 = 1'b1; s2 = 1'b1;
        #10; 
        $display("%0dns\t %b %b %b | %b    %b", $time, a2, b2, s2, y2_gate, y2_dataflow);

        // Case 3: s2 = 0, a = 1, b = 0 => y = 1
        a2 = 1'b1; b2 = 1'b0; s2 = 1'b0;
        #10; 
        $display("%0dns\t %b %b %b | %b    %b", $time, a2, b2, s2, y2_gate, y2_dataflow);

        // Case 4: s2 = 1, a = 1, b = 0 => y = 0
        a2 = 1'b1; b2 = 1'b0; s2 = 1'b1;
        #10; 
        $display("%0dns\t %b %b %b | %b    %b", $time, a2, b2, s2, y2_gate, y2_dataflow);

        // Testbench for MUX 4:1 Structural & Behavioral
        $display("====================================");
        $display("   TESTBENCH MUX 4:1                ");
        $display("====================================");
        $display("Time\t   A  B  C  D | S | Y_Struct    Y_Behave");
        $display("------------------------------------╝");

        // Case 1: s4 = 00, a = 0, b = 1, c = 0, d = 1 => y = 0
        a4 = 1'b0; b4 = 1'b1; c4 = 1'b0; d4 = 1'b1; s4 = 2'b00;
        #10;
        $display("%0dns\t %b %b %b %b | %b | %b    %b", $time, a4, b4, c4, d4, s4, y4_structural, y4_behavioral);

        // Case 2: s4 = 01, a = 0, b = 1, c = 0, d = 1 => y = 1
        a4 = 1'b0; b4 = 1'b1; c4 = 1'b0; d4 = 1'b1; s4 = 2'b01;
        #10; 
        $display("%0dns\t %b %b %b %b | %b | %b    %b", $time, a4, b4, c4, d4, s4, y4_structural, y4_behavioral);

        // Case 3: s4 = 10, a = 0, b = 1, c = 0, d = 1 => y = 0
        a4 = 1'b0; b4 = 1'b1; c4 = 1'b0; d4 = 1'b1; s4 = 2'b10;
        #10; 
        $display("%0dns\t %b %b %b %b | %b | %b    %b", $time, a4, b4, c4, d4, s4, y4_structural, y4_behavioral);

        // Case 4: s4 = 11, a = 0, b = 1, c = 0, d = 1 => y = 1
        a4 = 1'b0; b4 = 1'b1; c4 = 1'b0; d4 = 1'b1; s4 = 2'b11;
        #10; 
        $display("%0dns\t %b %b %b %b | %b | %b    %b", $time, a4, b4, c4, d4, s4, y4_structural, y4_behavioral);

        // Testbench for MUX 8:1 Structural
        $display("====================================");
        $display("   TESTBENCH MUX 8:1                ");
        $display("====================================");
        $display("Time\t  D (Inputs)   S | Y_Struct");
        $display("------------------------------------");

        d8 = 8'b10100110;

        // Test all 8 cases for s8
        for (i = 0; i < 8; i = i + 1) begin
            s8 = i;
            #10;
            $display("%0dns\t %b | %b | %b", $time, d8, s8, y8_structural);
        end

        // Testbench for Parameterized MUX 2:1
        $display("====================================");
        $display("   TESTBENCH PARAM_MUX 2:1            ");
        $display("====================================");
        $display("Time\t   A  B  S | Y_Param");
        $display("------------------------------------");

        // Case 1: s = 0, a = 0, b = 1 => y = 0
        param_a = 4'b0000; param_b = 4'b1111; param_s = 1'b0;
        #10;
        $display("%0dns\t %b %b %b | %b", $time, param_a, param_b, param_s, param_y);

        // Case 2: s = 1, a = 0, b = 1 => y = 1
        param_a = 4'b0000; param_b = 4'b1111; param_s = 1'b1;
        #10; 
        $display("%0dns\t %b %b %b | %b", $time, param_a, param_b, param_s, param_y);

        // Case 3: s = 0, a = 1, b = 0 => y = 1
        param_a = 4'b1111; param_b = 4'b0000; param_s = 1'b0;
        #10; 
        $display("%0dns\t %b %b %b | %b", $time, param_a, param_b, param_s, param_y);

        // Case 4: s = 1, a = 1, b = 0 => y = 0
        param_a = 4'b1111; param_b = 4'b0000; param_s = 1'b1;
        #10; 
        $display("%0dns\t %b %b %b | %b", $time, param_a, param_b, param_s, param_y);

        $finish();
    end

    initial begin
        $dumpfile("tb_mux.vcd");
        $dumpvars(0, tb_mux);
    end
    
endmodule