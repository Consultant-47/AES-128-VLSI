module Cipher(
	input wire DIN,
	input wire clk,
	input wire reset_n,
	input wire EN,
	input wire [127:0] Key_0,
	input wire [127:0] Key_1,
	input wire [127:0] Key_2,
	input wire [127:0] Key_3,
	input wire [127:0] Key_4,
	input wire [127:0] Key_5,
	input wire [127:0] Key_6,
	input wire [127:0] Key_7,
	input wire [127:0] Key_8,
	input wire [127:0] Key_9,
	input wire [127:0] Key_10,
	output wire DOUT,
	output wire OUT_VAL
);

	wire [2:0] Sel_State;
	wire [3:0] Sel_Key;
	wire WR_EN_IN_REG, WR_EN_STATE_REG, WR_EN_OUT_REG, reset_FSM;
	
	Cipher_DP DP(
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
		.WR_EN_IN_REG(WR_EN_IN_REG),
		.WR_EN_STATE_REG(WR_EN_STATE_REG),
		.WR_EN_OUT_REG(WR_EN_OUT_REG),
		.Sel_State(Sel_State),
		.Sel_Key(Sel_Key),
		.DOUT(DOUT)
	);
	
	assign reset_FSM = reset_n & EN;
	
	Cipher_FSM FSM(
		.clk(clk),
		.reset_n(reset_FSM),
		.WR_EN_IN_REG(WR_EN_IN_REG),
		.WR_EN_STATE_REG(WR_EN_STATE_REG),
		.WR_EN_OUT_REG(WR_EN_OUT_REG),
		.Sel_State(Sel_State),
		.Sel_Key(Sel_Key),
		.OUT_VAL(OUT_VAL)
	);
	
endmodule 