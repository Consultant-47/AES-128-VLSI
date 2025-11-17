module SubBytes (
    input  wire [127:0] state_in,  // Input state (4x4 matrix, 128 bits)
    output wire [127:0] state_out  // Output state after ShiftRows
);
    // Splitting the state into bytes
    wire [7:0] s00, s01, s02, s03;  // Row 0
    wire [7:0] s10, s11, s12, s13;  // Row 1
    wire [7:0] s20, s21, s22, s23;  // Row 2
    wire [7:0] s30, s31, s32, s33;  // Row 3

    assign {s00, s10, s20, s30,
            s01, s11, s21, s31,
            s02, s12, s22, s32,
            s03, s13, s23, s33} = state_in;
				
	 // transformed state matrix
    wire [7:0] t00, t01, t02, t03;  // Row 0
    wire [7:0] t10, t11, t12, t13;  // Row 1
    wire [7:0] t20, t21, t22, t23;  // Row 2
    wire [7:0] t30, t31, t32, t33;  // Row 3

    // Instantiate the SubByte modules
    SubByte sb00 (.byte_in(s00), .byte_out(t00));
	 SubByte sb01 (.byte_in(s01), .byte_out(t01));
	 SubByte sb02 (.byte_in(s02), .byte_out(t02));
	 SubByte sb03 (.byte_in(s03), .byte_out(t03));

	 SubByte sb10 (.byte_in(s10), .byte_out(t10));
	 SubByte sb11 (.byte_in(s11), .byte_out(t11));
	 SubByte sb12 (.byte_in(s12), .byte_out(t12));
	 SubByte sb13 (.byte_in(s13), .byte_out(t13));

	 SubByte sb20 (.byte_in(s20), .byte_out(t20));
	 SubByte sb21 (.byte_in(s21), .byte_out(t21));
	 SubByte sb22 (.byte_in(s22), .byte_out(t22));
	 SubByte sb23 (.byte_in(s23), .byte_out(t23));

	 SubByte sb30 (.byte_in(s30), .byte_out(t30));
	 SubByte sb31 (.byte_in(s31), .byte_out(t31));
	 SubByte sb32 (.byte_in(s32), .byte_out(t32));
	 SubByte sb33 (.byte_in(s33), .byte_out(t33));

    // Combining the shifted rows into the output state
    assign state_out = {t00, t10, t20, t30,
								t01, t11, t21, t31,
								t02, t12, t22, t32,
								t03, t13, t23, t33};
endmodule

module SubByte(byte_in, byte_out);
    input [7:0] byte_in;
    output [7:0] byte_out;
    wire [7:0] tildeb;
    Binv gen_tildeb(.byte_in(byte_in), .byte_inv(tildeb));

    assign byte_out[0] = tildeb[0] ^ tildeb[4] ^ tildeb[5] ^ tildeb[6] ^ tildeb[7] ^ 1'b1;
    assign byte_out[1] = tildeb[1] ^ tildeb[5] ^ tildeb[6] ^ tildeb[7] ^ tildeb[0] ^ 1'b1;
    assign byte_out[2] = tildeb[2] ^ tildeb[6] ^ tildeb[7] ^ tildeb[0] ^ tildeb[1] ^ 1'b0;
    assign byte_out[3] = tildeb[3] ^ tildeb[7] ^ tildeb[0] ^ tildeb[1] ^ tildeb[2] ^ 1'b0;
    assign byte_out[4] = tildeb[4] ^ tildeb[0] ^ tildeb[1] ^ tildeb[2] ^ tildeb[3] ^ 1'b0;
    assign byte_out[5] = tildeb[5] ^ tildeb[1] ^ tildeb[2] ^ tildeb[3] ^ tildeb[4] ^ 1'b1;
    assign byte_out[6] = tildeb[6] ^ tildeb[2] ^ tildeb[3] ^ tildeb[4] ^ tildeb[5] ^ 1'b1;
    assign byte_out[7] = tildeb[7] ^ tildeb[3] ^ tildeb[4] ^ tildeb[5] ^ tildeb[6] ^ 1'b0;
    
endmodule

module Binv(byte_in, byte_inv);
    input [7:0] byte_in;
    output [7:0] byte_inv;

    wire [7:0] pow2, pow4, pow6, pow8, pow14, pow16, pow30, pow32, pow62, pow64, pow126, pow128;

    Multiply_Byte mult_byte0(byte_in, byte_in, pow2);
    Multiply_Byte mult_byte1(pow2, pow2, pow4);
    Multiply_Byte mult_byte2(pow4, pow4, pow8);
    Multiply_Byte mult_byte3(pow8, pow8, pow16);
    Multiply_Byte mult_byte4(pow16, pow16, pow32);
    Multiply_Byte mult_byte5(pow32, pow32, pow64);
    Multiply_Byte mult_byte6(pow64, pow64, pow128);

    // Now calculating the 254th power of byte_in
    Multiply_Byte mult_byte7(pow2, pow4, pow6);
    Multiply_Byte mult_byte8(pow6, pow8, pow14);
    Multiply_Byte mult_byte9(pow14, pow16, pow30);
    Multiply_Byte mult_byte10(pow30, pow32, pow62);
    Multiply_Byte mult_byte11(pow62, pow64, pow126);
    Multiply_Byte mult_byte12(pow126, pow128, byte_inv);

endmodule

module Multiply_Byte(byte_1, byte_2, byte_out);
    input [7:0] byte_1, byte_2;
    output [7:0] byte_out;
    
    // Assuming the byte byte_2 to be the multiplier
    wire [7:0] times2, times4, times8, times16, times32, times64, times128;
    Times2 mult_byte1(byte_1, times2);
    Times2 mult_byte2(times2, times4);
    Times2 mult_byte3(times4, times8);
    Times2 mult_byte4(times8, times16);
    Times2 mult_byte5(times16, times32);
    Times2 mult_byte6(times32, times64);
    Times2 mult_byte7(times64, times128);

    // Now checking the bits of byte_2 to determine which results to add.
    wire [7:0] result_1, result_2, result_3, result_4, result_5, result_6, result_7, result_8;

    assign result_1 = byte_2[0] ? byte_1 : 8'b0;
    assign result_2 = byte_2[1] ? times2 : 8'b0;
    assign result_3 = byte_2[2] ? times4 : 8'b0;
    assign result_4 = byte_2[3] ? times8 : 8'b0;
    assign result_5 = byte_2[4] ? times16 : 8'b0;
    assign result_6 = byte_2[5] ? times32 : 8'b0;
    assign result_7 = byte_2[6] ? times64 : 8'b0;
    assign result_8 = byte_2[7] ? times128 : 8'b0;

    wire [7:0] sum_1, sum_2, sum_3, sum_4, sum_5, sum_6;

    Add_Byte add_byte0(result_1, result_2, sum_1);
    Add_Byte add_byte1(sum_1, result_3, sum_2);
    Add_Byte add_byte2(sum_2, result_4, sum_3);
    Add_Byte add_byte3(sum_3, result_5, sum_4);
    Add_Byte add_byte4(sum_4, result_6, sum_5);
    Add_Byte add_byte5(sum_5, result_7, sum_6);
    Add_Byte add_byte6(sum_6, result_8, byte_out);
endmodule

module Times2(byte_in, byte_out);
    input [7:0] byte_in;
    output [7:0] byte_out;

    assign byte_out = (byte_in[7] == 1'b0) ? (byte_in << 1) : ((byte_in << 1) ^ 8'h1B);
endmodule

module Add_Byte(byte_1, byte_2, byte_out);
    input [7:0] byte_1, byte_2;
    output [7:0] byte_out;

    assign byte_out = byte_1 ^ byte_2;
endmodule