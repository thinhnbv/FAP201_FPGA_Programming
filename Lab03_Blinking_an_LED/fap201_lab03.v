module fap201_lab03 (
    input wire clk,
    input wire SW1,
    output reg D1
);

    reg sw1_reg0;
    reg sw1_reg1;

    initial begin
        D1 = 1'b0;
        sw1_reg0 = 1'b1;
        sw1_reg1 = 1'b1;
    end

    always @(posedge clk) begin
        sw1_reg0 <= SW1;
        sw1_reg1 <= sw1_reg0;
    end

    wire sw1_released = (sw1_reg1 == 1'b0 && sw1_reg0 == 1'b1);

    always @(posedge clk) begin
        if (sw1_released) begin
            D1 <= ~D1;
        end
    end

endmodule