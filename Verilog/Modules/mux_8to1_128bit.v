module mux_8to1_128bit (
    input wire [127:0] in0, // Input 0
    input wire [127:0] in1, // Input 1
    input wire [127:0] in2, // Input 2
    input wire [127:0] in3, // Input 3
    input wire [127:0] in4, // Input 4
	 input wire [127:0] in5, // Input 2
    input wire [127:0] in6, // Input 3
    input wire [127:0] in7, // Input 4
    input wire [2:0]   sel, // 3-bit select signal
    output wire [127:0] out // Output
);

    assign out = (sel == 3'b000) ? in0 :
                 (sel == 3'b001) ? in1 :
                 (sel == 3'b010) ? in2 :
                 (sel == 3'b011) ? in3 :
                 (sel == 3'b100) ? in4 :
					  (sel == 3'b101) ? in5 :
                 (sel == 3'b110) ? in6 :
                 (sel == 3'b111) ? in7 :
                 128'b0; // Default case

endmodule
