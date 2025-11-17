module ShiftReg_4x128(
	input wire clk,
	input wire reset_n,
	input wire WR_EN,
	input wire LD,
	input wire [127:0] key,
	input wire [31:0] word,
	output wire [31:0] word_3, //initially 4th word ie key[31:0]
	output wire [31:0] word_0  //initially 1st word ie key[127:96]
);
	reg [31:0] w0, w1, w2, w3;

	always @(posedge clk or negedge reset_n) begin
		 if (reset_n == 1'b0) begin
			  w0 <= 32'b0;  // Reset all bits to 0
			  w1 <= 32'b0;  // Reset all bits to 0
			  w2 <= 32'b0;  // Reset all bits to 0
			  w3 <= 32'b0;  // Reset all bits to 0
		 end else if (LD == 1'b1) begin
			  w0 <= key[127:96];
			  w1 <= key[95:64];
			  w2 <= key[63:32];
			  w3 <= key[31:0];
		 end else if (WR_EN == 1'b1) begin
			  w0 <= w1;
			  w1 <= w2;
			  w2 <= w3;
			  w3 <= word; 
		 end
	end
	
	assign word_3 = w3;
	
	assign word_0 = w0;
	
endmodule 