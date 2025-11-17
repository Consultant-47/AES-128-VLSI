module toplevel(
	input wire DIN,
	input wire clk,
	input wire reset_n,
	input wire EN,
	input wire K_IN,
	output wire DOUT,
	output wire OUT_VAL
);
	
	 wire [127:0] Key_0;
    wire [127:0] Key_1;
    wire [127:0] Key_2;
    wire [127:0] Key_3;
    wire [127:0] Key_4;
    wire [127:0] Key_5;
    wire [127:0] Key_6;
    wire [127:0] Key_7;
    wire [127:0] Key_8;
    wire [127:0] Key_9;
    wire [127:0] Key_10;

	Cipher C (
        .DIN(DIN),
        .clk(clk),
        .reset_n(reset_n),
        .EN(EN),
        .Key_0(Key_0),
        .Key_1(Key_1),
        .Key_2(Key_2),
        .Key_3(Key_3),
        .Key_4(Key_4),
        .Key_5(Key_5),
        .Key_6(Key_6),
        .Key_7(Key_7),
        .Key_8(Key_8),
        .Key_9(Key_9),
        .Key_10(Key_10),
        .DOUT(DOUT),
        .OUT_VAL(OUT_VAL)
    );
	 
	 KeyGen dut (
        .clk(clk),
        .reset_n(reset_n),
		  .K_IN(K_IN),
        .Key_0(Key_0),
        .Key_1(Key_1),
        .Key_2(Key_2),
        .Key_3(Key_3),
        .Key_4(Key_4),
        .Key_5(Key_5),
        .Key_6(Key_6),
        .Key_7(Key_7),
        .Key_8(Key_8),
        .Key_9(Key_9),
        .Key_10(Key_10)
    );
	 
endmodule 