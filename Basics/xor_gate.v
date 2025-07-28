// Create a module that implements an XNOR gate.
module xor_gate( 
    input a, 
    input b, 
    output out );
  assign out = ~(a ^ b);
endmodule
