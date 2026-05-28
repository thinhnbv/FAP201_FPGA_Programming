module lfsr_nbit #(
    parameter WIDTH = 23
)(
    input i_clk,
    input i_rst_n,
    output o_lfsr_done
);

    reg [WIDTH-1:0] r_lfsr;
    wire w_feedback;

    // 
    assign w_feedback = (WIDTH == 4) ? ~(r_lfsr[3] ^ r_lfsr[2]) : (WIDTH == 22) ? ~(r_lfsr[21] ^ r_lfsr[20]) : ~(r_lfsr[22] ^ r_lfsr[17]);

    // 
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_lfsr <= {WIDTH{1'b0}};
        end else begin
            r_lfsr <= {r_lfsr[WIDTH-2:0], w_feedback};
        end
    end

    assign o_lfsr_done = (r_lfsr == 0);

endmodule