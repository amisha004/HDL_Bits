// Create a 100-bit binary ripple-carry adder by instantiating 100 full adders. The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out. 
// To encourage you to actually instantiate full adders, also output the carry-out from each full adder in the ripple-carry adder. 
// cout[99] is the final carry-out from the last full adder, and is the carry-out you usually see.
module adder_100( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    wire [99:0] carry;

    full_adder full_adder_inst[99:0] (
        .a   (a),
        .b   (b),
        .cin ({carry[98:0], cin}),
        .sum (sum),
        .cout(carry)
    );

    assign cout = carry;

endmodule

module full_adder (
    input  logic a, b, cin,
    output logic sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

