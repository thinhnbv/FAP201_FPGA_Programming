`timescale 1ns / 1ps 

module tb_fap201_lab01;

    reg SW1;
    reg SW2;
    reg SW3;

    wire D1;
    wire D2;
    wire D3;

    fap201_lab01 uut (
        .SW1(SW1),
        .SW2(SW2),
        .SW3(SW3),
        .D1(D1),
        .D2(D2),
        .D3(D3)
    );

    initial begin
        
        SW1 = 0; SW2 = 0; SW3 = 0;
        #20;
        SW1 = 1; SW2 = 0; SW3 = 0;
        #20;
        SW1 = 0; SW2 = 1; SW3 = 0;
        #20;
        SW1 = 0; SW2 = 0; SW3 = 1;
        #20;
        SW1 = 1; SW2 = 1; SW3 = 0;
        #20;
        SW1 = 1; SW2 = 0; SW3 = 1;
        #20;
        SW1 = 0; SW2 = 1; SW3 = 1;
        #20;
        SW1 = 1; SW2 = 1; SW3 = 1;
        #20;

        $finish;
    end

endmodule