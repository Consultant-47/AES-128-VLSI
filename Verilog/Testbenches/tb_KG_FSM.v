`timescale 1ns / 1ps

module tb_KG_FSM;

    // Inputs
    reg clk;
    reg reset_n;
	 
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

    // Instantiate the Cipher_FSM module
    KeyGen_FSM dut (
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

    // Clock generation
    always begin
        #5 clk = ~clk;  // Clock period of 10ns
    end

    // Stimulus block
    initial begin
		  $dumpfile("waveforms.vcd");
        $dumpvars(0, dut);
        // Initialize inputs
        clk = 0;
        reset_n = 0;

        // Apply reset
        #7 reset_n = 1; // Release reset after 7ns

        
        #10000 $finish;
    end

endmodule
