module AddRoundKey (
    input  wire [127:0] state_in,  // Input state (4x4 matrix, 128 bits)
	 input  wire [127:0] key_exp,   // expanded key
    output wire [127:0] state_out  // Output state after ShiftRows
);
    // Splitting the state into bytes
    wire [7:0] s00, s01, s02, s03;  // Row 0
    wire [7:0] s10, s11, s12, s13;  // Row 1
    wire [7:0] s20, s21, s22, s23;  // Row 2
    wire [7:0] s30, s31, s32, s33;  // Row 3
	 
	 // Splitting the state into bytes
    wire [7:0] k00, k01, k02, k03;  // Row 0
    wire [7:0] k10, k11, k12, k13;  // Row 1
    wire [7:0] k20, k21, k22, k23;  // Row 2
    wire [7:0] k30, k31, k32, k33;  // Row 3

    assign {s00, s10, s20, s30,
            s01, s11, s21, s31,
            s02, s12, s22, s32,
            s03, s13, s23, s33} = state_in;
				
	 assign {k00, k10, k20, k30,
            k01, k11, k21, k31,
            k02, k12, k22, k32,
            k03, k13, k23, k33} = key_exp;


    // Performing the row shifts
    wire [7:0] t00 = s00 ^ k00, t01 = s01 ^ k01, t02 = s02 ^ k02, t03 = s03 ^ k03;
    wire [7:0] t10 = s10 ^ k10, t11 = s11 ^ k11, t12 = s12 ^ k12, t13 = s13 ^ k13;
    wire [7:0] t20 = s20 ^ k20, t21 = s21 ^ k21, t22 = s22 ^ k22, t23 = s23 ^ k23;
    wire [7:0] t30 = s30 ^ k30, t31 = s31 ^ k31, t32 = s32 ^ k32, t33 = s33 ^ k33;

    // Combining the shifted rows into the output state
    assign state_out = {t00, t10, t20, t30,
								t01, t11, t21, t31,
								t02, t12, t22, t32,
								t03, t13, t23, t33};
endmodule
