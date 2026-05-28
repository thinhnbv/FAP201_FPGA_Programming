`timescale 1ns/1ps

module tb_fap201_lab05;

    reg clk;
    reg rst_n;
    reg SW1;
    reg SW2;

    wire led1;
    wire led2;
    wire led3;
    wire led4;

    fap201_lab05 #(
        .WIDTH(4)
    ) uut (
        .i_clk(clk),
        .i_rst_n(rst_n),
        .i_SW1(SW1),
        .i_SW2(SW2),
        .o_LED_1(led1),
        .o_LED_2(led2),
        .o_LED_3(led3),
        .o_LED_4(led4)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        SW1 = 0;
        SW2 = 0;

        $display("=================================");
        $display("        TESTBENCH LAB05");
        $display("=================================");

        #40;
        rst_n = 1;
        $display("[TIME: %0dns] Start test.", $time);

        // Case 1: SW1 = 0, SW2 = 0 => LED_1
        SW2 = 0; SW1 = 0;
        $display("[TIME: %0dns] SW1 = %b, SW2 = %b => LED_1.", $time, SW1, SW2);
        #1000;

        // Case 2: SW1 = 1, SW2 = 0 => LED_2
        SW2 = 0; SW1 = 1;
        $display("[TIME: %0dns] SW1 = %b, SW2 = %b => LED_2.", $time, SW1, SW2);
        #1000;

        // Case 3: SW1 = 0, SW2 = 1 => LED_3
        SW2 = 1; SW1 = 0;
        $display("[TIME: %0dns] SW1 = %b, SW2 = %b => LED_3.", $time, SW1, SW2);
        #1000;

        // Case 4: SW1 = 1, SW2 = 1 => LED_4
        SW2 = 1; SW1 = 1;
        $display("[TIME: %0dns] SW1 = %b, SW2 = %b => LED_4.", $time, SW1, SW2);
        #1000;

        $display("[TIME: %0dns] Test finished.", $time);
        $finish;
    end

    initial begin
        $dumpfile("tb_fap201_lab05.vcd");
        $dumpvars(0, tb_fap201_lab05);
    end

endmodule