`timescale 1ns/1ps 

module tb_minterm_logic;
    reg a, b, c;
    wire f_orig;
    wire f_nand;
    wire f_nor;

    // 1. Goi module goc
    minterm_logic uut_orig (
        .a(a), .b(b), .c(c), .f(f_orig)
    );

    // 2. Goi module NAND
    minterm_nand_only uut_nand (
        .a(a), .b(b), .c(c), .f(f_nand)
    );

    // 3. Goi module NOR
    minterm_nor_only uut_nor (
        .a(a), .b(b), .c(c), .f(f_nor)
    );

    initial begin
        // Title
        $display("Time\t A B C | F_Orig F_NAND F_NOR");
        $display("-----------------------------------");
        
        // Cases
        {a, b, c} = 3'b000; #10; 
        $display("%0dns\t %b %b %b |   %b      %b      %b", $time, a, b, c, f_orig, f_nand, f_nor);
        
        {a, b, c} = 3'b001; #10; 
        $display("%0dns\t %b %b %b |   %b      %b      %b", $time, a, b, c, f_orig, f_nand, f_nor);
        
        {a, b, c} = 3'b010; #10; 
        $display("%0dns\t %b %b %b |   %b      %b      %b", $time, a, b, c, f_orig, f_nand, f_nor);
        
        {a, b, c} = 3'b011; #10; 
        $display("%0dns\t %b %b %b |   %b      %b      %b", $time, a, b, c, f_orig, f_nand, f_nor);
        
        {a, b, c} = 3'b100; #10; 
        $display("%0dns\t %b %b %b |   %b      %b      %b", $time, a, b, c, f_orig, f_nand, f_nor);
        
        {a, b, c} = 3'b101; #10; 
        $display("%0dns\t %b %b %b |   %b      %b      %b", $time, a, b, c, f_orig, f_nand, f_nor);
        
        {a, b, c} = 3'b110; #10; 
        $display("%0dns\t %b %b %b |   %b      %b      %b", $time, a, b, c, f_orig, f_nand, f_nor);
        
        {a, b, c} = 3'b111; #10; 
        $display("%0dns\t %b %b %b |   %b      %b      %b", $time, a, b, c, f_orig, f_nand, f_nor);
        
        $finish; 
    end

    initial begin
        $dumpfile("tb_lab1.vcd");
        $dumpvars(0, tb_minterm_logic);
    end

endmodule