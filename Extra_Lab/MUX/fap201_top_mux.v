module fap201_top_mux (
    input SW1, SW2, SW3,
    output D1
);

    mux_2to1 my_mux (
        .a(SW1),
        .b(SW2),
        .s(SW3),
        .y(D1)
    );

endmodule