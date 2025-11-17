module KeyGen_DP(
	input wire clk,
	input wire K_IN,
	input wire reset_n,
	input wire EN,
	input wire sel,
	input wire [3:0] Rcon_index,
	input wire WR_EN_SR,
	input wire LD_SR,
	input wire WR_EN_KS,
	input wire WR_EN_IN_REG,
	input wire WR_EN_K0,
	input wire [3:0] index_KS,
	input wire [1:0] blk_no_KS,
	output wire [127:0] Key_0,
	output wire [127:0] Key_1,
	output wire [127:0] Key_2,
	output wire [127:0] Key_3,
	output wire [127:0] Key_4,
	output wire [127:0] Key_5,
	output wire [127:0] Key_6,
	output wire [127:0] Key_7,
	output wire [127:0] Key_8,
	output wire [127:0] Key_9,
	output wire [127:0] Key_10
);
	
	wire [127:0] key;
	wire [31:0] word_out, word_3, word_0, word_i1, Rcon_out, word_i2, word_i3, mux_o;
	wire WR_EN_IN_REG_EN, WR_EN_KS_EN, WR_EN_SR_EN, LD_SR_EN;
	
	assign WR_EN_IN_REG_EN = WR_EN_IN_REG & EN;
	assign WR_EN_KS_EN = WR_EN_KS & EN;
	assign WR_EN_SR_EN = WR_EN_SR & EN;
	assign LD_SR_EN = LD_SR & EN;
	
	SIPO_128bit IN_REG (
        .WR_EN(WR_EN_IN_REG_EN),
        .clk(clk),
        .reset_n(reset_n),
        .serial_in(K_IN),
        .parallel_out(key)
    );
	 
	 KeyStorage KS(
		  .clk(clk),
		  .reset_n(reset_n),
		  .WR_EN(WR_EN_KS_EN),
		  .index(index_KS),
		  .blk_no(blk_no_KS),
		  .word(word_out),
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
	 
	 BlockRegister BR(
			.CLK(clk),
			.RST_N(reset_n),
			.WR_EN(WR_EN_K0),
			.block_in(key),
			.block_out(Key_0)
	 );
	 
	 ShiftReg_4x128 SR(
			.clk(clk),
			.reset_n(reset_n),
			.WR_EN(WR_EN_SR_EN),
			.LD(LD_SR_EN),
			.key(key),
			.word(word_out),
			.word_3(word_3),
			.word_0(word_0)
	 );
	 
	 RotWord RW(
			.word(word_3),
			.out_word(word_i1)
	 );
	 
	 SubWord SW(
			.word(word_i1),
			.out_word(word_i2)
	 );
	 
	 Rcon RC(
			.j(Rcon_index),
			.Rcon_j(Rcon_out)
	 );
	 
	 assign word_i3 = Rcon_out ^ word_i2;
	 
	 mux_2to1_32bit MUX_2(
			.in0(word_3),
			.in1(word_i3),
			.sel(sel),
			.out(mux_o)
	 );
	 
	 assign word_out = word_0 ^ mux_o;
endmodule 
