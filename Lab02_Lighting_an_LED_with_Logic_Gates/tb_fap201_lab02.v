`timescale  1ns / 1ps

module tb_fap201_lab02;

    reg SW1;
    reg SW2;

    wire D1;

    fap201_lab02 uut (
        .SW1(SW1),
        .SW2(SW2),
        .D1(D1)
    );

    initial begin

        $display("Time\tSW1 SW2 | D1 (AND Gate)");
        $display("----------------------------)");

        // State 1: 00
        SW1 = 0; SW2 = 0; 
        #20;
        $display("%0dns/t %b %b | %b", $time, SW1, SW2, D1);

        // State 2: 01
        SW1 = 0; SW2 = 1; 
        #20;
        $display("%0dns/t %b %b | %b", $time, SW1, SW2, D1);

        // State 3: 10
        SW1 = 1; SW2 = 0; 
        #20;
        $display("%0dns/t %b %b | %b", $time, SW1, SW2, D1);

        // State 4: 11
        SW1 = 1; SW2 = 1; 
        #20;
        $display("%0dns/t %b %b | %b", $time, SW1, SW2, D1);

        $finish;
    end

endmodule