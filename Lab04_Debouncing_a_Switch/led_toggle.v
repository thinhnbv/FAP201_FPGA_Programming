module led_toggle (
    input wire i_clk,
    input wire i_SW1,
    output reg o_D1
);

    reg r_SW1;

    initial begin 
        o_D1 = 1'b0;
        r_SW1 = 1'b1;
    end

    always @(posedge i_clk) begin
        r_SW1 <= i_SW1;
    end

    wire SW1_released = (i_SW1 == 1'b1 && r_SW1 == 1'b0);

    always @(posedge i_clk) begin
        if (SW1_released) begin
            o_D1 <= ~o_D1;
        end
    end

endmodule