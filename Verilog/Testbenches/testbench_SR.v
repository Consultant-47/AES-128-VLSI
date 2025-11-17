`timescale 1 ns / 1 ns

module testbench_SR;
    reg WR_EN;                  // Write enable
    reg clk;                    // Clock
    reg reset_n;                // Asynchronous reset
    reg serial_in;              // Serial input
    wire [127:0] parallel_out;  // Parallel output

    // Instantiate the Design Under Test (DUT)
    SIPO_128bit dut (
        .WR_EN(WR_EN),
        .clk(clk),
        .reset_n(reset_n),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        reset_n = 0;
        WR_EN = 0;
        serial_in = 0;
        #17;                    // Wait for reset propagation

        // Release reset
        reset_n = 1;
        #10;

        // Test case: Shift 8 bits into the SIPO
        WR_EN = 1;
        for (integer i = 0; i < 8; i = i + 1) begin
            serial_in = i % 2;  // Random binary values
            #10;  // Wait for the clock edge
        end

        // Test case: Disable WR_EN and shift further bits (should not change)
        WR_EN = 0;
        serial_in = 1;
        #40;  // Wait for several clock cycles

        // Test case: Reset and verify output is cleared
        reset_n = 0;
        #10;
        reset_n = 1;
        #10;
		  $display("sim done");
        $finish;
    end
	 
	 initial
    begin
		  $display("waveforms dump done");
        $dumpfile("waveforms.vcd");
        $dumpvars(0, dut);
    end
endmodule
