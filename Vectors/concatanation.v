// Given several input vectors, concatenate them together then split them up into several output vectors. 
// There are six 5-bit input vectors: a, b, c, d, e, and f, for a total of 30 bits of input. There are four 8-bit output vectors: w, x, y, and z, for 32 bits of output. 
// The output should be a concatenation of the input vectors followed by two 1 bits

module concatanation (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );
	
    wire [31:0]conWire;
    assign conWire = {a[4:0], b[4:0], c[4:0], d[4:0], e[4:0], f[4:0], 2'b11};
    assign w = conWire[31:24];
    assign x = conWire[23:16];
    assign y = conWire[15:8];
    assign z = conWire[7:0];

endmodule
