module ShiftRows (
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

    // Performing the row shifts
    wire [7:0] t00 = s00, t01 = s01, t02 = s02, t03 = s03;  // Row 0: No shift
    wire [7:0] t10 = s11, t11 = s12, t12 = s13, t13 = s10;  // Row 1: Shift left by 1
    wire [7:0] t20 = s22, t21 = s23, t22 = s20, t23 = s21;  // Row 2: Shift left by 2
    wire [7:0] t30 = s33, t31 = s30, t32 = s31, t33 = s32;  // Row 3: Shift left by 3

    // Combining the shifted rows into the output state
    assign state_out = {t00, t10, t20, t30,
								t01, t11, t21, t31,
								t02, t12, t22, t32,
								t03, t13, t23, t33};
endmodule
