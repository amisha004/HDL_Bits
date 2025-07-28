// The hierarchy of modules is created by instantiating one module inside another, as long as all of the modules used belong to the same project (so the compiler knows where to find the module). 
// The code for one module is not written inside another module's body (Code for different modules are not nested).

// You may connect signals to the module by port name or port position.
module basic ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a moda_Inst(.out1(out1), .out2(out2), .in1(a), .in2(b), .in3(c), .in4(d));
endmodule
