module fap201_lab05 #(
    parameter WIDTH = 23
)(
    input i_clk,
    input i_rst_n,
    input i_SW1,
    input i_SW2,
    output o_LED_1,
    output o_LED_2,
    output o_LED_3,
    output o_LED_4
);

    wire w_lfsr_done;
    reg r_toggle;

    lfsr_nbit #(
        .WIDTH(WIDTH)
    ) lfsr_inst (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .o_lfsr_done(w_lfsr_done)
    );

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_toggle <= 1'b0;
        end else if (w_lfsr_done) begin
            r_toggle <= ~r_toggle;
        end
    end

    demux_1to4 demux_inst (
        .i_data(r_toggle),
        .i_sel({i_SW2, i_SW1}),
        .o_data_1(o_LED_1),
        .o_data_2(o_LED_2),
        .o_data_3(o_LED_3),
        .o_data_4(o_LED_4)
    );

endmodule