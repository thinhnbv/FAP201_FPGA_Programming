module demux_1to4 (
    input i_data,
    input [1:0] i_sel,
    output o_data_1,
    output o_data_2,
    output o_data_3,
    output o_data_4
);

    assign o_data_1 = (i_sel == 2'b00) ? i_data : 1'b0;
    assign o_data_2 = (i_sel == 2'b01) ? i_data : 1'b0;
    assign o_data_3 = (i_sel == 2'b10) ? i_data : 1'b0;
    assign o_data_4 = (i_sel == 2'b11) ? i_data : 1'b0;

endmodule