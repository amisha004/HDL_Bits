// Given five 1-bit signals (a, b, c, d, and e), compute all 25 pairwise one-bit comparisons in the 25-bit output vector. 
// The output should be 1 if the two bits being compared are equal.

// out[24] = ~a ^ a;   // a == a, so out[24] is always 1.
// out[23] = ~a ^ b;
// out[22] = ~a ^ c;
// ...
// out[ 1] = ~e ^ d;
// out[ 0] = ~e ^ e;
module replication_2 (
    input a, b, c, d, e,
    output [24:0] out );
    
    wire [24:0] repConc;
    wire [4:0] interRepConc;
    wire [24:0] abcdRepConc;
    assign interRepConc = {a,b,c,d,e};
    assign repConc = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}};
    assign abcdRepConc = {5{interRepConc}};
    assign out = ~  repConc ^ abcdRepConc;

endmodule
