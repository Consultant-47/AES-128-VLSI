module SIPO_128bit (
    input WR_EN,				// Enable
	 input clk,          // Clock input
    input reset_n,        // Asynchronous reset
    input serial_in,    // Serial input
    output reg [127:0] parallel_out // Parallel output
);

always @(posedge clk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        parallel_out <= 128'b0;  // Reset all bits to 0
    end else if (WR_EN == 1'b1) begin
        parallel_out <= {serial_in, parallel_out[127:1]}; // Shift left and add new serial input
    end
end

endmodule
