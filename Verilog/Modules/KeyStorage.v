module KeyStorage(
	input wire clk,
	input wire reset_n,
	input wire WR_EN,
	input wire[3:0] index,
	input wire [1:0] blk_no,//MS Block is 0 key = [B0, B1, B2, B3]
	input wire [31:0] word,
	output reg [127:0] Key_1,
	output reg [127:0] Key_2,
	output reg [127:0] Key_3,
	output reg [127:0] Key_4,
	output reg [127:0] Key_5,
	output reg [127:0] Key_6,
	output reg [127:0] Key_7,
	output reg [127:0] Key_8,
	output reg [127:0] Key_9,
	output reg [127:0] Key_10
);

	always @(posedge clk or negedge reset_n) begin
		 if (reset_n == 1'b0) begin
			  Key_1 <= 128'b0;  // Reset all bits to 0
			  Key_2 <= 128'b0;  // Reset all bits to 0
			  Key_3 <= 128'b0;  // Reset all bits to 0
			  Key_4 <= 128'b0;  // Reset all bits to 0
			  Key_5 <= 128'b0;  // Reset all bits to 0
			  Key_6 <= 128'b0;  // Reset all bits to 0
			  Key_7 <= 128'b0;  // Reset all bits to 0
			  Key_8 <= 128'b0;  // Reset all bits to 0
			  Key_9 <= 128'b0;  // Reset all bits to 0
			  Key_10 <= 128'b0; // Reset all bits to 0
		 end else if (WR_EN == 1'b1) begin
			  case (index)
					4'b0001: begin
						 case (blk_no)
							  2'b00: Key_1 <= {word, Key_1[95:0]};
							  2'b01: Key_1 <= {Key_1[127:96], word, Key_1[63:0]};
							  2'b10: Key_1 <= {Key_1[127:64], word, Key_1[31:0]};
							  2'b11: Key_1 <= {Key_1[127:32], word};
						 endcase
					end
					4'b0010: begin
						 case (blk_no)
							  2'b00: Key_2 <= {word, Key_2[95:0]};
							  2'b01: Key_2 <= {Key_2[127:96], word, Key_2[63:0]};
							  2'b10: Key_2 <= {Key_2[127:64], word, Key_2[31:0]};
							  2'b11: Key_2 <= {Key_2[127:32], word};
						 endcase
					end
					4'b0011: begin
						 case (blk_no)
							  2'b00: Key_3 <= {word, Key_3[95:0]};
							  2'b01: Key_3 <= {Key_3[127:96], word, Key_3[63:0]};
							  2'b10: Key_3 <= {Key_3[127:64], word, Key_3[31:0]};
							  2'b11: Key_3 <= {Key_3[127:32], word};
						 endcase
					end
					4'b0100: begin
						 case (blk_no)
							  2'b00: Key_4 <= {word, Key_4[95:0]};
							  2'b01: Key_4 <= {Key_4[127:96], word, Key_4[63:0]};
							  2'b10: Key_4 <= {Key_4[127:64], word, Key_4[31:0]};
							  2'b11: Key_4 <= {Key_4[127:32], word};
						 endcase
					end
					4'b0101: begin
						 case (blk_no)
							  2'b00: Key_5 <= {word, Key_5[95:0]};
							  2'b01: Key_5 <= {Key_5[127:96], word, Key_5[63:0]};
							  2'b10: Key_5 <= {Key_5[127:64], word, Key_5[31:0]};
							  2'b11: Key_5 <= {Key_5[127:32], word};
						 endcase
					end
					4'b0110: begin
						 case (blk_no)
							  2'b00: Key_6 <= {word, Key_6[95:0]};
							  2'b01: Key_6 <= {Key_6[127:96], word, Key_6[63:0]};
							  2'b10: Key_6 <= {Key_6[127:64], word, Key_6[31:0]};
							  2'b11: Key_6 <= {Key_6[127:32], word};
						 endcase
					end
					4'b0111: begin
						 case (blk_no)
							  2'b00: Key_7 <= {word, Key_7[95:0]};
							  2'b01: Key_7 <= {Key_7[127:96], word, Key_7[63:0]};
							  2'b10: Key_7 <= {Key_7[127:64], word, Key_7[31:0]};
							  2'b11: Key_7 <= {Key_7[127:32], word};
						 endcase
					end
					4'b1000: begin
						 case (blk_no)
							  2'b00: Key_8 <= {word, Key_8[95:0]};
							  2'b01: Key_8 <= {Key_8[127:96], word, Key_8[63:0]};
							  2'b10: Key_8 <= {Key_8[127:64], word, Key_8[31:0]};
							  2'b11: Key_8 <= {Key_8[127:32], word};
						 endcase
					end
					4'b1001: begin
						 case (blk_no)
							  2'b00: Key_9 <= {word, Key_9[95:0]};
							  2'b01: Key_9 <= {Key_9[127:96], word, Key_9[63:0]};
							  2'b10: Key_9 <= {Key_9[127:64], word, Key_9[31:0]};
							  2'b11: Key_9 <= {Key_9[127:32], word};
						 endcase
					end
					4'b1010: begin
						 case (blk_no)
							  2'b00: Key_10 <= {word, Key_10[95:0]};
							  2'b01: Key_10 <= {Key_10[127:96], word, Key_10[63:0]};
							  2'b10: Key_10 <= {Key_10[127:64], word, Key_10[31:0]};
							  2'b11: Key_10 <= {Key_10[127:32], word};
						 endcase
					end
			  endcase
		 end
	end
endmodule 