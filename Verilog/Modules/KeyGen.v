module KeyGen(
		input wire clk,
		input wire reset_n,
		input wire K_IN,
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

	 wire EN;
	 wire sel;
	 wire [3:0] Rcon_index;
	 wire WR_EN_SR;
	 wire LD_SR;
	 wire WR_EN_KS;
	 wire WR_EN_IN_REG;
	 wire WR_EN_K0;
	 wire [3:0] index_KS;
	 wire [1:0] blk_no_KS;

	KeyGen_FSM FSM (
        .clk(clk),
        .reset_n(reset_n),
        .EN(EN),
        .sel(sel),
		  .Rcon_index(Rcon_index),
		  .WR_EN_SR(WR_EN_SR),
		  .LD_SR(LD_SR),
		  .WR_EN_KS(WR_EN_KS),
		  .WR_EN_IN_REG(WR_EN_IN_REG),
		  .WR_EN_K0(WR_EN_K0),
		  .index_KS(index_KS),
		  .blk_no_KS(blk_no_KS)
    );
	 
	 KeyGen_DP DP(
			.clk(clk),
			.K_IN(K_IN),
			.reset_n(reset_n),
			.EN(EN),
			.sel(sel),
			.Rcon_index(Rcon_index),
			.WR_EN_SR(WR_EN_SR),
			.LD_SR(LD_SR),
			.WR_EN_KS(WR_EN_KS),
			.WR_EN_IN_REG(WR_EN_IN_REG),
			.WR_EN_K0(WR_EN_K0),
			.index_KS(index_KS),
			.blk_no_KS(blk_no_KS),
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