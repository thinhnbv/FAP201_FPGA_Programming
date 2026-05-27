// ============================== 
// 1. HALF ADDER MODULE
// ==============================

module half_adder (
    input A, B,
    output Sum, Cout
);

    assign Sum = A ^ B;
    assign Cout = A & B;

endmodule

// ==============================
// 2. FULL ADDER MODULE
// ==============================

module full_adder (
    input A, B, Cin,
    output Sum, Cout
);

    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));

endmodule

// ==============================
// 3. TWO-BIT ADDER MODULE
// ==============================

module two_bit_adder (
    input [1:0] A, B,
    output [1:0] Sum,
    output Cout
);

    wire S0, S1, S2, C0, C1, C2;

    half_adder ha0 (
        .A(A[0]),
        .B(B[0]),
        .Sum(S0),
        .Cout(C0)
    );

    half_adder ha1 (
        .A(A[1]),
        .B(B[1]),
        .Sum(S1),
        .Cout(C1)
    );

    half_adder ha2 (
        .A(C0),
        .B(S1),
        .Sum(S2),
        .Cout(C2)
    );

    assign Sum[0] = S0;
    assign Sum[1] = S2;
    assign Cout = C1 | C2;

endmodule
