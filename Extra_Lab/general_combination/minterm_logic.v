// Minterm logic: f = Σ(1,3,4,6,7) with inputs a,b,c
// Simplified: f = a'c + ab'c' + ab
// Implemented using AND, OR, NOT gates

// 1. MODULE GOC
module minterm_logic(a, b, c, f);
    input a, b, c;
    output f;
    
    wire not_a, not_b, not_c;
    wire term1, term2, term3;
    
    // Generate complements
    not (not_a, a);
    not (not_b, b);
    not (not_c, c);
    
    // Term 1: a'c
    and (term1, not_a, c);
    
    // Term 2: ab'c'
    and (term2, a, not_b, not_c);
    
    // Term 3: ab
    and (term3, a, b);
    
    // Final output: f = term1 + term2 + term3
    or (f, term1, term2, term3);

endmodule

// 2. MODULE NAND: 
// f = ((a'c)'.(a'b'c)'.(ab)')' 
module minterm_nand_only(a, b, c, f);
    input a, b, c;
    output f;

    wire na, nb, nc;
    wire t1, t2, t3;
    wire t2_step1, t2_step2;

    nand (na, a, a);
    nand (nb, b, b);
    nand (nc, c, c);

    nand (t1, na, c);

    nand (t2_step1, a, nb);
    not  (t2_step2, t2_step1);
    nand (t2, t2_step2, nc);

    nand (t3, a, b);

    nand (f, t1, t2, t3);
    
endmodule

// 3. MODULE NOR:
// f = [(a + c')' + (a' + b + c)' + (a' + b')']''
module minterm_nor_only(a, b, c, f);
    input a, b, c;
    output f;

    wire na, nb, nc;
    wire t1, t2, t3;
    wire t2_step1, t2_step2;
    wire nor_stage1;

    nor (na, a, a);
    nor (nb, b, b);
    nor (nc, c, c);

    nor (t1, a, nc);

    nor (t2_step1, na, b);
    not (t2_step2, t2_step1);
    nor (t2, t2_step2, c); 

    nor (t3, na, nb);

    nor (nor_stage1, t1, t2, t3);
    nor (f, nor_stage1, nor_stage1);

endmodule