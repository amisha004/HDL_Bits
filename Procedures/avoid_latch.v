// When designing circuits, you must think first in terms of circuits:

// I want this logic gate
// I want a combinational blob of logic that has these inputs and produces these outputs
// I want a combinational blob of logic followed by a set of flip-flops
// What you must not do is write the code first, then hope it generates a proper circuit.

// If (cpu_overheated) then shut_off_computer = 1;
// If (~arrived) then keep_driving = ~gas_tank_empty;
// Syntactically-correct code does not necessarily result in a reasonable circuit (combinational logic + flip-flops). 
// The usual reason is: "What happens in the cases other than those you specified?". Verilog's answer is: Keep the outputs unchanged.

// This behaviour of "keep outputs unchanged" means the current state needs to be remembered, and thus produces a latch. 
// Combinational logic (e.g., logic gates) cannot remember any state. Watch out for Warning (10240): ... inferring latch(es)" messages. 
// Unless the latch was intentional, it almost always indicates a bug. Combinational circuits must have a value assigned to all outputs under all conditions. 
// This usually means you always need else clauses or a default value assigned to the outputs.

module avoid_latch (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else
            shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else
            keep_driving = 0;
    end

endmodule
