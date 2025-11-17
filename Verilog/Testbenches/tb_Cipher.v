`timescale 1ns / 1ps
module tb_Cipher;

    // Inputs
    reg DIN;
    reg clk;
    reg reset_n;
    reg EN_DEC;
    reg EN;
    reg [127:0] Key_0;
    reg [127:0] Key_1;
    reg [127:0] Key_2;
    reg [127:0] Key_3;
    reg [127:0] Key_4;
    reg [127:0] Key_5;
    reg [127:0] Key_6;
    reg [127:0] Key_7;
    reg [127:0] Key_8;
    reg [127:0] Key_9;
    reg [127:0] Key_10;
	 reg [127:0] b;

    // Outputs
    wire DOUT;
    wire OUT_VAL;
	 

    // Instantiate the Cipher module
    Cipher dut (
        .DIN(DIN),
        .clk(clk),
        .reset_n(reset_n),
        .EN_DEC(EN_DEC),
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
        EN_DEC = 0;
        EN = 1;
        DIN = 0;
        Key_0 = 128'h2b7e151628aed2a6abf7158809cf4f3c; // Example Key
        Key_1 = 128'ha0fafe1788542cb123a339392a6c7605; // Example Key
        Key_2 = 128'hf2c295f27a96b9435935807a7359f67f; // Example Key
        Key_3 = 128'h3d80477d4716fe3e1e237e446d7a883b; // Example Key
        Key_4 = 128'hef44a541a8525b7fb671253bdb0bad00; // Example Key
        Key_5 = 128'hd4d1c6f87c839d87caf2b8bc11f915bc; // Example Key
        Key_6 = 128'h6d88a37a110b3efddbf98641ca0093fd; // Example Key
        Key_7 = 128'h4e54f70e5f5fc9f384a64fb24ea6dc4f; // Example Key
        Key_8 = 128'head27321b58dbad2312bf5607f8d292f; // Example Key
        Key_9 = 128'hac7766f319fadc2128d12941575c006e; // Example Key
        Key_10 = 128'hd014f9a8c9ee2589e13f0cc8b6630ca6; // Example Key
		  b = 128'h3243f6a8885a308d313198a2e0370734;
        // Apply reset
        #7 reset_n = 1;

        // Start feeding DIN bit by bit, LSB first
         #3  DIN = b[0];
			#10 DIN = b[1];
			#10 DIN = b[2];
			#10 DIN = b[3];
			#10 DIN = b[4];
			#10 DIN = b[5];
			#10 DIN = b[6];
			#10 DIN = b[7];
			#10 DIN = b[8];
			#10 DIN = b[9];
			#10 DIN = b[10];
			#10 DIN = b[11];
			#10 DIN = b[12];
			#10 DIN = b[13];
			#10 DIN = b[14];
			#10 DIN = b[15];
			#10 DIN = b[16];
			#10 DIN = b[17];
			#10 DIN = b[18];
			#10 DIN = b[19];
			#10 DIN = b[20];
			#10 DIN = b[21];
			#10 DIN = b[22];
			#10 DIN = b[23];
			#10 DIN = b[24];
			#10 DIN = b[25];
			#10 DIN = b[26];
			#10 DIN = b[27];
			#10 DIN = b[28];
			#10 DIN = b[29];
			#10 DIN = b[30];
			#10 DIN = b[31];
			#10 DIN = b[32];
			#10 DIN = b[33];
			#10 DIN = b[34];
			#10 DIN = b[35];
			#10 DIN = b[36];
			#10 DIN = b[37];
			#10 DIN = b[38];
			#10 DIN = b[39];
			#10 DIN = b[40];
			#10 DIN = b[41];
			#10 DIN = b[42];
			#10 DIN = b[43];
			#10 DIN = b[44];
			#10 DIN = b[45];
			#10 DIN = b[46];
			#10 DIN = b[47];
			#10 DIN = b[48];
			#10 DIN = b[49];
			#10 DIN = b[50];
			#10 DIN = b[51];
			#10 DIN = b[52];
			#10 DIN = b[53];
			#10 DIN = b[54];
			#10 DIN = b[55];
			#10 DIN = b[56];
			#10 DIN = b[57];
			#10 DIN = b[58];
			#10 DIN = b[59];
			#10 DIN = b[60];
			#10 DIN = b[61];
			#10 DIN = b[62];
			#10 DIN = b[63];
			#10 DIN = b[64];
			#10 DIN = b[65];
			#10 DIN = b[66];
			#10 DIN = b[67];
			#10 DIN = b[68];
			#10 DIN = b[69];
			#10 DIN = b[70];
			#10 DIN = b[71];
			#10 DIN = b[72];
			#10 DIN = b[73];
			#10 DIN = b[74];
			#10 DIN = b[75];
			#10 DIN = b[76];
			#10 DIN = b[77];
			#10 DIN = b[78];
			#10 DIN = b[79];
			#10 DIN = b[80];
			#10 DIN = b[81];
			#10 DIN = b[82];
			#10 DIN = b[83];
			#10 DIN = b[84];
			#10 DIN = b[85];
			#10 DIN = b[86];
			#10 DIN = b[87];
			#10 DIN = b[88];
			#10 DIN = b[89];
			#10 DIN = b[90];
			#10 DIN = b[91];
			#10 DIN = b[92];
			#10 DIN = b[93];
			#10 DIN = b[94];
			#10 DIN = b[95];
			#10 DIN = b[96];
			#10 DIN = b[97];
			#10 DIN = b[98];
			#10 DIN = b[99];
			#10 DIN = b[100];
			#10 DIN = b[101];
			#10 DIN = b[102];
			#10 DIN = b[103];
			#10 DIN = b[104];
			#10 DIN = b[105];
			#10 DIN = b[106];
			#10 DIN = b[107];
			#10 DIN = b[108];
			#10 DIN = b[109];
			#10 DIN = b[110];
			#10 DIN = b[111];
			#10 DIN = b[112];
			#10 DIN = b[113];
			#10 DIN = b[114];
			#10 DIN = b[115];
			#10 DIN = b[116];
			#10 DIN = b[117];
			#10 DIN = b[118];
			#10 DIN = b[119];
			#10 DIN = b[120];
			#10 DIN = b[121];
			#10 DIN = b[122];
			#10 DIN = b[123];
			#10 DIN = b[124];
			#10 DIN = b[125];
			#10 DIN = b[126];
			#10 DIN = b[127];
			#10 DIN = 1'b0;


        // Continue feeding bits for the remaining HEX constant (if needed)

        // Wait for some time to observe output
        #1000000;

        // Finish simulation
        $finish;
    end

endmodule
