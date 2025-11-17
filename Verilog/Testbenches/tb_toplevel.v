`timescale 1ns / 1ps
module tb_toplevel;

    reg DIN;
	 reg KIN;
	 reg EN;
    reg clk;
    reg reset_n;
	 reg [127:0] D;
	 reg [127:0] K;
	 
	 wire DOUT;
	 wire OUT_VAL;

    // Instantiate the Cipher module
    toplevel dut (
		  .DIN(DIN),
        .clk(clk),
        .reset_n(reset_n),
		  .EN(EN),
		  .K_IN(KIN),
		  .DOUT(DOUT),
		  .OUT_VAL(OUT_VAL)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Clock period = 10ns
    end

    // Test stimulus
    initial begin
		  $dumpfile("waveforms.vcd");
        $dumpvars(0, dut);
        // Initialize all inputs
        clk = 0;
        reset_n = 0;
		  EN = 1;
        DIN = 0;
		  K = 128'h2b7e151628aed2a6abf7158809cf4f3c;
		  D = 128'h3243f6a8885a308d313198a2e0370734;
        // Apply reset
        #7 reset_n = 1;

        // Start feeding DIN bit by bit, LSB first
         #3  DIN = D[0]; KIN = K[0];
			#10 DIN = D[1]; KIN = K[1];
			#10 DIN = D[2]; KIN = K[2];
			#10 DIN = D[3]; KIN = K[3];
			#10 DIN = D[4]; KIN = K[4];
			#10 DIN = D[5]; KIN = K[5];
			#10 DIN = D[6]; KIN = K[6];
			#10 DIN = D[7]; KIN = K[7];
			#10 DIN = D[8]; KIN = K[8];
			#10 DIN = D[9]; KIN = K[9];
			#10 DIN = D[10]; KIN = K[10];
			#10 DIN = D[11]; KIN = K[11];
			#10 DIN = D[12]; KIN = K[12];
			#10 DIN = D[13]; KIN = K[13];
			#10 DIN = D[14]; KIN = K[14];
			#10 DIN = D[15]; KIN = K[15];
			#10 DIN = D[16]; KIN = K[16];
			#10 DIN = D[17]; KIN = K[17];
			#10 DIN = D[18]; KIN = K[18];
			#10 DIN = D[19]; KIN = K[19];
			#10 DIN = D[20]; KIN = K[20];
			#10 DIN = D[21]; KIN = K[21];
			#10 DIN = D[22]; KIN = K[22];
			#10 DIN = D[23]; KIN = K[23];
			#10 DIN = D[24]; KIN = K[24];
			#10 DIN = D[25]; KIN = K[25];
			#10 DIN = D[26]; KIN = K[26];
			#10 DIN = D[27]; KIN = K[27];
			#10 DIN = D[28]; KIN = K[28];
			#10 DIN = D[29]; KIN = K[29];
			#10 DIN = D[30]; KIN = K[30];
			#10 DIN = D[31]; KIN = K[31];
			#10 DIN = D[32]; KIN = K[32];
			#10 DIN = D[33]; KIN = K[33];
			#10 DIN = D[34]; KIN = K[34];
			#10 DIN = D[35]; KIN = K[35];
			#10 DIN = D[36]; KIN = K[36];
			#10 DIN = D[37]; KIN = K[37];
			#10 DIN = D[38]; KIN = K[38];
			#10 DIN = D[39]; KIN = K[39];
			#10 DIN = D[40]; KIN = K[40];
			#10 DIN = D[41]; KIN = K[41];
			#10 DIN = D[42]; KIN = K[42];
			#10 DIN = D[43]; KIN = K[43];
			#10 DIN = D[44]; KIN = K[44];
			#10 DIN = D[45]; KIN = K[45];
			#10 DIN = D[46]; KIN = K[46];
			#10 DIN = D[47]; KIN = K[47];
			#10 DIN = D[48]; KIN = K[48];
			#10 DIN = D[49]; KIN = K[49];
			#10 DIN = D[50]; KIN = K[50];
			#10 DIN = D[51]; KIN = K[51];
			#10 DIN = D[52]; KIN = K[52];
			#10 DIN = D[53]; KIN = K[53];
			#10 DIN = D[54]; KIN = K[54];
			#10 DIN = D[55]; KIN = K[55];
			#10 DIN = D[56]; KIN = K[56];
			#10 DIN = D[57]; KIN = K[57];
			#10 DIN = D[58]; KIN = K[58];
			#10 DIN = D[59]; KIN = K[59];
			#10 DIN = D[60]; KIN = K[60];
			#10 DIN = D[61]; KIN = K[61];
			#10 DIN = D[62]; KIN = K[62];
			#10 DIN = D[63]; KIN = K[63];
			#10 DIN = D[64]; KIN = K[64];
			#10 DIN = D[65]; KIN = K[65];
			#10 DIN = D[66]; KIN = K[66];
			#10 DIN = D[67]; KIN = K[67];
			#10 DIN = D[68]; KIN = K[68];
			#10 DIN = D[69]; KIN = K[69];
			#10 DIN = D[70]; KIN = K[70];
			#10 DIN = D[71]; KIN = K[71];
			#10 DIN = D[72]; KIN = K[72];
			#10 DIN = D[73]; KIN = K[73];
			#10 DIN = D[74]; KIN = K[74];
			#10 DIN = D[75]; KIN = K[75];
			#10 DIN = D[76]; KIN = K[76];
			#10 DIN = D[77]; KIN = K[77];
			#10 DIN = D[78]; KIN = K[78];
			#10 DIN = D[79]; KIN = K[79];
			#10 DIN = D[80]; KIN = K[80];
			#10 DIN = D[81]; KIN = K[81];
			#10 DIN = D[82]; KIN = K[82];
			#10 DIN = D[83]; KIN = K[83];
			#10 DIN = D[84]; KIN = K[84];
			#10 DIN = D[85]; KIN = K[85];
			#10 DIN = D[86]; KIN = K[86];
			#10 DIN = D[87]; KIN = K[87];
			#10 DIN = D[88]; KIN = K[88];
			#10 DIN = D[89]; KIN = K[89];
			#10 DIN = D[90]; KIN = K[90];
			#10 DIN = D[91]; KIN = K[91];
			#10 DIN = D[92]; KIN = K[92];
			#10 DIN = D[93]; KIN = K[93];
			#10 DIN = D[94]; KIN = K[94];
			#10 DIN = D[95]; KIN = K[95];
			#10 DIN = D[96]; KIN = K[96];
			#10 DIN = D[97]; KIN = K[97];
			#10 DIN = D[98]; KIN = K[98];
			#10 DIN = D[99]; KIN = K[99];
			#10 DIN = D[100]; KIN = K[100];
			#10 DIN = D[101]; KIN = K[101];
			#10 DIN = D[102]; KIN = K[102];
			#10 DIN = D[103]; KIN = K[103];
			#10 DIN = D[104]; KIN = K[104];
			#10 DIN = D[105]; KIN = K[105];
			#10 DIN = D[106]; KIN = K[106];
			#10 DIN = D[107]; KIN = K[107];
			#10 DIN = D[108]; KIN = K[108];
			#10 DIN = D[109]; KIN = K[109];
			#10 DIN = D[110]; KIN = K[110];
			#10 DIN = D[111]; KIN = K[111];
			#10 DIN = D[112]; KIN = K[112];
			#10 DIN = D[113]; KIN = K[113];
			#10 DIN = D[114]; KIN = K[114];
			#10 DIN = D[115]; KIN = K[115];
			#10 DIN = D[116]; KIN = K[116];
			#10 DIN = D[117]; KIN = K[117];
			#10 DIN = D[118]; KIN = K[118];
			#10 DIN = D[119]; KIN = K[119];
			#10 DIN = D[120]; KIN = K[120];
			#10 DIN = D[121]; KIN = K[121];
			#10 DIN = D[122]; KIN = K[122];
			#10 DIN = D[123]; KIN = K[123];
			#10 DIN = D[124]; KIN = K[124];
			#10 DIN = D[125]; KIN = K[125];
			#10 DIN = D[126]; KIN = K[126];
			#10 DIN = D[127]; KIN = K[127];
			#10 DIN = 1'b0; KIN = 1'b0;


        // Continue feeding bits for the remaining HEX constant (if needed)

        // Wait for some time to observe output
        #1000000;

        // Finish simulation
        $finish;
    end

endmodule
