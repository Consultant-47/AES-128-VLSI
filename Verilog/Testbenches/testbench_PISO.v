`timescale 1 ns / 1 ps

module testbench_PISO;
    reg clk;                    // Clock
    reg reset_n;                // Asynchronous reset
    reg WR_EN;                  // Write enable
    reg [127:0] parallel_in;    // Parallel input
    wire serial_out;            // Serial output

    // Instantiate the Design Under Test (DUT)
    PISO_128bit dut (
        .clk(clk),
        .reset_n(reset_n),
        .WR_EN(WR_EN),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 ns clock period
    end

    // Test stimulus
    initial begin
        $dumpfile("waveforms.vcd");
        $dumpvars(0, dut);

        // Initialize inputs
        reset_n = 0;
        WR_EN = 0;
        parallel_in = 128'b0;
        #20;                    // Wait for reset propagation

        // Release reset
        reset_n = 1;
        #13;

        // Test case: Load parallel data and shift out
        WR_EN = 1;
        parallel_in = 128'hA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5; // Load alternating pattern
        #10;
        WR_EN = 0;              // Disable write enable for shifting
        #1280;                  // Wait for all 128 bits to shift out (128 clock cycles)

        // Test case: Reset and verify
        reset_n = 0;
        #10;
        reset_n = 1;
        #10;

        $finish;
    end
endmodule
