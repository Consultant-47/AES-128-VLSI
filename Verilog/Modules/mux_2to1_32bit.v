module mux_2to1_32bit (
    input wire [31:0] in0, // Input 0
    input wire [31:0] in1, // Input 1
    input wire sel, // 1-bit select signal
    output wire [31:0] out // Output
);

    assign out = (sel == 1'b0) ? in0 :
                 (sel == 1'b1) ? in1 :
                 31'b0; // Default case

endmodule
