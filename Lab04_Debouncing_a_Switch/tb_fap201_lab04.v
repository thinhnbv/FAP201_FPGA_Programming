`timescale 1ns / 1ps

module tb_fap201_lab04;

    reg r_clk;
    reg r_SW1;
    wire w_D1;

    fap201_lab04 uut_system (
        .i_clk(r_clk),
        .i_SW1(r_SW1),
        .o_D1(w_D1) 
    );

    defparam uut_system.debounce_inst.DEBOUNCE_LIMIT = 10;

    always #10 r_clk = ~r_clk;

    initial begin
        r_clk = 0;
        r_SW1 = 1; 
        #100;

        $display("[TIME: %0dns] --- Switch Pressed: Multiple Glitches ---", $time);
        r_SW1 = 0; #30;
        r_SW1 = 1; #15;
        r_SW1 = 0; #25;
        r_SW1 = 1; #35;

        r_SW1 = 0;
        #300;

        $display("[TIME: %0dns] --- Switch Released: Multiple Glitches ---", $time);
        r_SW1 = 1; #20;
        r_SW1 = 0; #15;
        r_SW1 = 1; #30;
        r_SW1 = 0; #25;

        r_SW1 = 1;
        #400;

        $display("[TIME: %0dns] --- Test Complete. Final LED Status ---", $time);
        $finish;
    end

endmodule