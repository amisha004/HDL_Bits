// The 7458 is a chip with four AND gates and two OR gates.
module circuit_7458 ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
	  wire p2ab_inter, p2cd_inter,p1abc_inter,p1efd_inter;
    assign p2ab_inter = p2a & p2b;
    assign p2cd_inter = p2c & p2d;
    assign p2y = p2ab_inter | p2cd_inter;
    
    assign p1abc_inter = p1a & p1b & p1c;
    assign p1efd_inter = p1d & p1e & p1f;
    assign p1y = p1abc_inter | p1efd_inter;

endmodule
