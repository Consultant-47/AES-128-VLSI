module MixColumns (
    input  wire [127:0] state_in,  // Input state (4x4 matrix, 128 bits)
    output wire [127:0] state_out  // Output state after MixColumns
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

    // MixColumns logic for one column
    function [7:0] xtime (input [7:0] b);
        // Multiply by x (i.e., 0x02 in GF(2^8))
        xtime = (b << 1) ^ (8'h1b & {8{b[7]}});  // Conditional XOR with 0x1b if MSB is 1
    endfunction

    function [7:0] mix (input [7:0] a, input [7:0] b, input [7:0] c, input [7:0] d, input integer row);
        // Mix logic for one row
        case (row)
            0: mix = xtime(a) ^ (xtime(b) ^ b) ^ c ^ d;  // 02*a + 03*b + 01*c + 01*d
            1: mix = a ^ xtime(b) ^ (xtime(c) ^ c) ^ d;  // 01*a + 02*b + 03*c + 01*d
            2: mix = a ^ b ^ xtime(c) ^ (xtime(d) ^ d);  // 01*a + 01*b + 02*c + 03*d
            3: mix = (xtime(a) ^ a) ^ b ^ c ^ xtime(d);  // 03*a + 01*b + 01*c + 02*d
        endcase
    endfunction

    // MixColumns for each column
    // transformed state matrix
    wire [7:0] t00, t01, t02, t03;  // Row 0
    wire [7:0] t10, t11, t12, t13;  // Row 1
    wire [7:0] t20, t21, t22, t23;  // Row 2
    wire [7:0] t30, t31, t32, t33;  // Row 3
	 
	 assign t00 = mix(s00, s10, s20, s30, 0);
	 assign t10 = mix(s00, s10, s20, s30, 1);
	 assign t20 = mix(s00, s10, s20, s30, 2);
	 assign t30 = mix(s00, s10, s20, s30, 3);
	 
	 assign t01 = mix(s01, s11, s21, s31, 0);
	 assign t11 = mix(s01, s11, s21, s31, 1);
	 assign t21 = mix(s01, s11, s21, s31, 2);
	 assign t31 = mix(s01, s11, s21, s31, 3);
	 
	 assign t02 = mix(s02, s12, s22, s32, 0);
	 assign t12 = mix(s02, s12, s22, s32, 1);
	 assign t22 = mix(s02, s12, s22, s32, 2);
	 assign t32 = mix(s02, s12, s22, s32, 3);
	 
	 assign t03 = mix(s03, s13, s23, s33, 0);
	 assign t13 = mix(s03, s13, s23, s33, 1);
	 assign t23 = mix(s03, s13, s23, s33, 2);
	 assign t33 = mix(s03, s13, s23, s33, 3);

    // Combining the shifted rows into the output state
    assign state_out = {t00, t10, t20, t30,
								t01, t11, t21, t31,
								t02, t12, t22, t32,
								t03, t13, t23, t33};

endmodule
