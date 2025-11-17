module mux_11to1_128bit (
    input wire [127:0] in0, // Input 0
    input wire [127:0] in1, // Input 1
    input wire [127:0] in2, // Input 2
    input wire [127:0] in3, // Input 3
    input wire [127:0] in4, // Input 4
	 input wire [127:0] in5, // Input 5
    input wire [127:0] in6, // Input 6
    input wire [127:0] in7, // Input 7
    input wire [127:0] in8, // Input 8
    input wire [127:0] in9, // Input 9
	 input wire [127:0] in10,// Input 10
    input wire [3:0]   sel, // 4-bit select signal
    output wire [127:0] out // Output
);

    assign out = (sel == 4'b0000) ? in0 :
                 (sel == 4'b0001) ? in1 :
                 (sel == 4'b0010) ? in2 :
                 (sel == 4'b0011) ? in3 :
                 (sel == 4'b0100) ? in4 :
					  (sel == 4'b0101) ? in5 :
                 (sel == 4'b0110) ? in6 :
                 (sel == 4'b0111) ? in7 :
                 (sel == 4'b1000) ? in8 :
                 (sel == 4'b1001) ? in9 :
					  (sel == 4'b1010) ? in10 :
                 128'b0; // Default case

endmodule
