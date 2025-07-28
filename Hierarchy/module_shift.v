// You are given a module my_dff with two inputs and one output (that implements a D flip-flop). Instantiate three of them, then chain them together to make a shift register of length 3. 
// The clk port needs to be connected to all instances.

// The module provided to you is: module my_dff ( input clk, input d, output q );

// Note that to make the internal connections, you will need to declare some wires. Be careful about naming your wires and module instances: the names must be unique.

module module_shift ( input clk, input d, output q );
    wire q1, q2;
    my_dff dff_inst1(.clk(clk), .d(d), .q(q1));
    my_dff dff_inst2(.clk(clk), .d(q1), .q(q2));
    my_dff dff_inst3(.clk(clk), .d(q2), .q(q));
endmodule
