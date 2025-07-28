// Given four unsigned numbers, find the minimum. Unsigned numbers can be compared with standard comparison operators (a < b). 
// Use the conditional operator to make two-way min circuits, then compose a few of them to create a 4-way min circuit. 
// You'll probably want some wire vectors for the intermediate results.
module ternary_operator (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] temp1, temp2, temp3;
    assign temp1 = (a < b) ? a: b;
    assign temp2 = (temp1 < c) ? temp1 : c;
    assign temp3 = (temp2 < d) ? temp2: d;
    
    assign min = temp3;

endmodule
