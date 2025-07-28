// An adder-subtractor can be built from an adder by optionally negating one of the inputs, which is equivalent to inverting the input then adding 1. 
// The net result is a circuit that can do two operations: (a + b + 0) and (a + ~b + 1). See Wikipedia if you want a more detailed explanation of how this circuit works.

// Build the adder-subtractor below.

// You are provided with a 16-bit adder module, which you need to instantiate twice:

// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

// Use a 32-bit wide XOR gate to invert the b input whenever sub is 1. (This can also be viewed as b[31:0] XORed with sub replicated 32 times.
module adder_subtractor(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] inter_sub;
    wire [31:0] inter_b_in;
    wire [15:0] lsb_sum;
    wire [15:0] msb_sum;
    wire inter_sub_cout;
    assign inter_sub = {32{sub}};
    assign inter_b_in = inter_sub ^ b;
    
    add16 add16_inst_lsb(.a(a[15:0]), .b(inter_b_in[15:0]), .cin(sub), .sum(lsb_sum), .cout(inter_sub_cout));
    add16 add16_inst_msb(.a(a[31:16]), .b(inter_b_in[31:16]), .cin(inter_sub_cout), .sum(msb_sum), .cout());
    assign sum = {msb_sum, lsb_sum};

endmodule
