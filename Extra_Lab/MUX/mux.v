// 2-1 MUX Gate Level
module mux_2to1_gate (
    input a,
    input b,
    input s,
    output y
);

    wire not_s;
    wire a_sel, b_sel;

    not (not_s, s);
    and (a_sel, a, not_s);
    and (b_sel, b, s);
    or (y, a_sel, b_sel);

endmodule

// 2-1 MUX Data Flow
module mux_2to1 (
    input a, 
    input b,
    input s,
    output y
);

    assign y = s ? b : a;

endmodule

// 4-1 MUX Structural
module mux_4to1_structural (
    input a,
    input b,
    input c,
    input d,
    input [1:0] s,
    output y
);

    wire mux_ab;
    wire mux_cd;

    mux_2to1 m1 (
        .a(a),
        .b(b),
        .s(s[0]),
        .y(mux_ab)
    );

    mux_2to1 m2 (
        .a(c),
        .b(d),
        .s(s[0]),
        .y(mux_cd)
    );

    mux_2to1 m3 (
        .a(mux_ab),
        .b(mux_cd),
        .s(s[1]),
        .y(y)
    );

endmodule

// 4-1 MUX Behavioral 
module mux_4to1 (
    input a,
    input b,
    input c,
    input d,
    input [1:0] s,
    output reg y
);

    always @(*) begin
        case (s)
            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            2'b11: y = d;
            default: y = 1'bx;
        endcase
    end

endmodule

// 8-1 MUX Structural
module mux_8to1_structural (
    input [7:0] d,
    input [2:0] s,
    output y
);

    wire mux_lower;
    wire mux_upper;

    mux_4to1 mux_low (
        .a(d[0]),
        .b(d[1]),
        .c(d[2]),
        .d(d[3]),
        .s(s[1:0]),
        .y(mux_lower)
    );

    mux_4to1 mux_high (
        .a(d[4]),
        .b(d[5]),
        .c(d[6]),
        .d(d[7]),
        .s(s[1:0]),
        .y(mux_upper)
    );

    mux_2to1 mux_final (
        .a(mux_lower),
        .b(mux_upper),
        .s(s[2]),
        .y(y)
    );

endmodule

// Parameterized MUX N-bit 2-to-1 MUX
module param_mux_2to1 #(
    parameter WIDTH = 8
)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input s,
    output [WIDTH-1:0] y
);

    assign y = s ? b : a;

endmodule