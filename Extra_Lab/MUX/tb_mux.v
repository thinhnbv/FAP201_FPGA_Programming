`timescale 1ns/1ps

module tb_mux;

    reg a2, b2, s2;
    wire y2_gate;
    wire y2_dataflow;

    mux_2to1_gate uut_mux2_gate (
        .a(a2),
        .b(b2),
        .s(s2),
        .y(y2_gate)
    );

    mux_2to1 uut_mux2_dataflow (
        .a(a2),
        .b(b2),
        .s(s2),
        .y(y2_dataflow)
    );

    initial begin
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

        $finish();
    end

    initial begin
        $dumpfile("tb_mux.vcd");
        $dumpvars(0, tb_mux);
    end
    
endmodule