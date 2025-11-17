module Cipher_DP(
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
	input wire WR_EN_IN_REG,
	input wire WR_EN_STATE_REG,
	input wire WR_EN_OUT_REG,
	input wire [2:0] Sel_State,
	input wire [3:0] Sel_Key,
	output wire DOUT
);

	wire [127:0] block, State_in, ARK_Out, MC_Out, SR_Out, SB_Out, State_out, Key, ISB_Out, ISR_Out, IMC_Out;
	
	wire WR_EN_IN_REG_EN, WR_EN_STATE_REG_EN, WR_EN_OUT_REG_EN;
	
	assign WR_EN_IN_REG_EN = WR_EN_IN_REG & EN;
	assign WR_EN_STATE_REG_EN = WR_EN_STATE_REG & EN;
	assign WR_EN_OUT_REG_EN = WR_EN_OUT_REG & EN;
	
	mux_11to1_128bit MUX_11 (
        .in0(Key_0),
        .in1(Key_1),
        .in2(Key_2),
        .in3(Key_3),
        .in4(Key_4),
		  .in5(Key_5),
        .in6(Key_6),
        .in7(Key_7),
        .in8(Key_8),
        .in9(Key_9),
		  .in10(Key_10),
        .sel(Sel_Key),
        .out(Key)
    );
	
	SIPO_128bit IN_REG (
        .WR_EN(WR_EN_IN_REG_EN),
        .clk(clk),
        .reset_n(reset_n),
        .serial_in(DIN),
        .parallel_out(block)
    );
	 
	 mux_8to1_128bit MUX_8 (
        .in0(block),
        .in1(SB_Out),
        .in2(SR_Out),
        .in3(MC_Out),
        .in4(ARK_Out),
		  .in5(ISB_Out),
		  .in6(ISR_Out),
		  .in7(IMC_Out),
        .sel(Sel_State),
        .out(State_in)
    );
	 
	 BlockRegister BR(clk, reset_n, WR_EN_STATE_REG_EN, State_in, State_out);
	 
	 SubBytes SB(.state_in(State_out), .state_out(SB_Out));
	 
	 InvSubBytes ISB(.state_in(State_out), .state_out(ISB_Out));
	 
	 ShiftRows SR(.state_in(State_out), .state_out(SR_Out));
	 
	 InvShiftRows ISR(.state_in(State_out), .state_out(ISR_Out));
	 
	 MixColumns MC(.state_in(State_out), .state_out(MC_Out));
	 
	 InvMixColumns IMC(.state_in(State_out), .state_out(IMC_Out));
	 
	 AddRoundKey ARK(.state_in(State_out), .key_exp(Key), .state_out(ARK_Out));
	 
	 PISO_128bit OUT_REG (
        .clk(clk),
        .reset_n(reset_n),
        .WR_EN(WR_EN_OUT_REG_EN),
        .parallel_in(ARK_Out),
        .serial_out(DOUT)
    );
	 
endmodule 