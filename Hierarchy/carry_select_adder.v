// One drawback of the ripple carry adder (See previous exercise) is that the delay for an adder to compute the carry out (from the carry-in, in the worst case) is fairly slow, 
// and the second-stage adder cannot begin computing its carry-out until the first-stage adder has finished. 
// This makes the adder slow. One improvement is a carry-select adder, shown below. 
// The first-stage adder is the same as before, but we duplicate the second-stage adder, one assuming carry-in=0 and one assuming carry-in=1, 
// then using a fast 2-to-1 multiplexer to select which result happened to be correct.

// In this exercise, you are provided with the same module add16 as the previous exercise, which adds two 16-bit numbers with carry-in and 
// produces a carry-out and 16-bit sum. You must instantiate three of these to build the carry-select adder, using your own 16-bit 2-to-1 multiplexer.

// Connect the modules together as shown in the diagram below. The provided module add16 has the following declaration:

// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
module carry_select_adder(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] inter_sum0;
    wire [15:0] inter_sum1;
    wire [15:0] inter_lsb_sum;
    wire [15:0] inter_msb_sum;
    wire inter_cout;
    add16 add16_inst_lsb(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(inter_lsb_sum), .cout(inter_cout));
    add16 add16_inst_msb0(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(inter_sum0), .cout());
    add16 add16_inst_msb1(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(inter_sum1), .cout());
    
    always @(*)
        begin
            case (inter_cout)
                1'b0: inter_msb_sum = inter_sum0;
                1'b1: inter_msb_sum = inter_sum1;
            endcase
        end
    
    assign sum = {inter_msb_sum, inter_lsb_sum};
    
endmodule
