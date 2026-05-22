module fap201_lab04 (
    input i_clk,
    input i_SW1,
    output o_D1
);

    wire w_debounced_sw;

    debounce_filter #(.DEBOUNCE_LIMIT(250000)) 
    
    debounce_inst (
        .i_clk(i_clk),
        .i_bouncy(i_SW1),
        .o_debounced(w_debounced_sw)
    );

    led_toggle led_inst(
        .i_clk(i_clk),
        .i_SW1(w_debounced_sw),
        .o_D1(o_D1)
    );

endmodule