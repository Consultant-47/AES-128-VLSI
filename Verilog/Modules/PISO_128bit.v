module PISO_128bit (
    input clk,                   // Clock input
    input reset_n,               // Asynchronous reset
    input WR_EN,                  // Load control signal
    input [127:0] parallel_in,   // Parallel data input
    output wire serial_out        // Serial data output
);

reg [127:0] shift_reg; // Internal shift register

always @(posedge clk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        shift_reg <= 128'b0;   // Reset all bits to 0
    end else if (WR_EN == 1'b1) begin
        shift_reg <= parallel_in; // Load parallel data into shift register
    end else begin
		  shift_reg <= {1'b0, shift_reg[127:1]}; // Shift right
    end
end

assign serial_out = shift_reg[0];

endmodule
