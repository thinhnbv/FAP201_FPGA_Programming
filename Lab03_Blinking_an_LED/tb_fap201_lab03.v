`timescale 1ns / 1ps

module tb_fap201_lab03;

    reg clk;
    reg SW1;
    wire D1;

    fap201_lab03 uut (
        .clk(clk),
        .SW1(SW1),
        .D1(D1)
    );

    always #10 clk = ~clk;

    initial begin
        
        clk = 0;
        SW1 = 1;

        $display("Time\tCLK\tSW1\t|\tD1 (LED Status)");
        $display("----------------------------------");

        #40;
        // First try
        SW1 = 0;
        #80;
        SW1 = 1;

        #100;

        // Second try
        SW1 = 0;
        #80;
        SW1 = 1;

        #60;

        $finish;
    end

    initial begin 
        $monitor("%0dns\t %b\t %b\t|\t %b", $time, clk, SW1, D1);
    end

endmodule