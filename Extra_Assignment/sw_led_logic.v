module sw_led_logic (
    input  wire A, 
    input  wire B, 
    input  wire C, 
    output wire X, 
    output wire Y, 
    output wire Z  
);
    assign X = (~A & B) | (~A & ~C) | (A & ~B & C);

    assign Y = (~A & C) | (A & ~B);

    assign Z = (A & B) | (A & ~C) | (B & ~C);

endmodule