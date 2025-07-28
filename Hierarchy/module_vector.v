// You are given a module my_dff8 with two inputs and one output (that implements a set of 8 D flip-flops). 
// Instantiate three of them, then chain them together to make a 8-bit wide shift register of length 3. 
// In addition, create a 4-to-1 multiplexer (not provided) that chooses what to output depending on sel[1:0]: 
// The value at the input d, after the first, after the second, or after the third D flip-flop. (Essentially, sel selects how many cycles to delay the input, from zero to three clock cycles.)

// The module provided to you is: module my_dff8 ( input clk, input [7:0] d, output [7:0] q );

module module_vector ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] q1;
    wire [7:0] q2;
    wire [7:0] q3;
    
    my_dff8 my_dff_inst1(.clk(clk), .d(d), .q(q1));
    my_dff8 my_dff_inst2(.clk(clk), .d(q1), .q(q2));
    my_dff8 my_dff_inst3(.clk(clk), .d(q2), .q(q3));
    
    always @(*)
        begin
            case(sel)
                    2'b00: q = d;
                    2'b01: q = q1;
                    2'b10: q = q2;
                    2'b11: q = q3;
            endcase
        end
                
endmodule
