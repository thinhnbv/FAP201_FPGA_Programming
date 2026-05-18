module fap201_lab02 (
    input wire SW1,
    input wire SW2,
    output wire D1
);

    assign D1 = SW1 & SW2;

endmodule