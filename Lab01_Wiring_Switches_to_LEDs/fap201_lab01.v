module fap201_lab01 (
    input wire SW1, 
    input wire SW2,
    input wire SW3,
    output wire D1,
    output wire D2, 
    output wire D3
);

    assign D1 = SW1;
    assign D2 = SW2;
    assign D3 = SW3;

endmodule