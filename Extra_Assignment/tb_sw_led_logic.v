`timescale 1ns / 1ps

module tb_sw_led_logic;

    reg A;
    reg B;
    reg C;
    wire X;
    wire Y;
    wire Z;

    sw_led_logic uut (
        .A(A), 
        .B(B), 
        .C(C), 
        .X(X), 
        .Y(Y), 
        .Z(Z)
    );

    initial begin
        $display("Time\tSW1(A) SW2(B) SW3(C) | D1(X) D2(Y) D3(Z)");
        $display("-------------------------------------------");
        
        A = 0; B = 0; C = 0; #10;
        $display("%0dns\t   %b      %b      %b   |   %b     %b     %b", $time, A, B, C, X, Y, Z);
        
        A = 0; B = 0; C = 1; #10;
        $display("%0dns\t   %b      %b      %b   |   %b     %b     %b", $time, A, B, C, X, Y, Z);
        
        A = 0; B = 1; C = 0; #10;
        $display("%0dns\t   %b      %b      %b   |   %b     %b     %b", $time, A, B, C, X, Y, Z);
        
        A = 0; B = 1; C = 1; #10;
        $display("%0dns\t   %b      %b      %b   |   %b     %b     %b", $time, A, B, C, X, Y, Z);
        
        A = 1; B = 0; C = 0; #10;
        $display("%0dns\t   %b      %b      %b   |   %b     %b     %b", $time, A, B, C, X, Y, Z);
        
        A = 1; B = 0; C = 1; #10;
        $display("%0dns\t   %b      %b      %b   |   %b     %b     %b", $time, A, B, C, X, Y, Z);
        
        A = 1; B = 1; C = 0; #10;
        $display("%0dns\t   %b      %b      %b   |   %b     %b     %b", $time, A, B, C, X, Y, Z);
        
        A = 1; B = 1; C = 1; #10;
        $display("%0dns\t   %b      %b      %b   |   %b     %b     %b", $time, A, B, C, X, Y, Z);

        $finish;
    end
      
endmodule