// Implement the following circuit. Create two intermediate wires (named anything you want) to connect the AND and OR gates together. 
// Note that the wire that feeds the NOT gate is really wire out, so you do not necessarily need to declare a third wire here. 
// Notice how wires are driven by exactly one source (output of a gate), but can feed multiple inputs.

module circuit_1(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
  
	  wire ab;
    wire cd;
    assign ab = a & b;
    assign cd = c & d;
    assign out = ab | cd;
    assign out_n = ~ (ab | cd);
endmodule
