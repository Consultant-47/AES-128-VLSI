`timescale 1ns / 1ps

module tb_Cipher_FSM;

    // Inputs
    reg clk;
    reg reset_n;
    reg key_change;

    // Outputs
    wire [9:0] state;

    // Instantiate the Cipher_FSM module
    Cipher_FSM dut (
        .clk(clk),
        .reset_n(reset_n),
        .key_change(key_change),
        .state(state)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // Clock period of 10ns
    end

    // Stimulus block
    initial begin
		  $dumpfile("waveforms.vcd");
        $dumpvars(0, dut);
        // Initialize inputs
        clk = 0;
        reset_n = 0;
        key_change = 0;

        // Apply reset
        #7 reset_n = 1; // Release reset after 7ns

        
        #10000 $finish;
    end

    // Monitor state for debugging
    initial begin
        $monitor("At time %t, state = %b", $time, state);
    end

endmodule
