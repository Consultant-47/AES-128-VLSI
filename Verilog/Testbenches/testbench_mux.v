`timescale 1 ns / 1 ps

module testbench_mux;

    reg [127:0] Tin0, Tin1, Tin2, Tin3, Tin4;
    reg [2:0] Tsel;
    wire [127:0] Tout;

    // Instantiate the multiplexer
    mux_5to1_128bit dut (
        .in0(Tin0),
        .in1(Tin1),
        .in2(Tin2),
        .in3(Tin3),
        .in4(Tin4),
        .sel(Tsel),
        .out(Tout)
    );

    initial begin
		  $dumpfile("waveforms.vcd");
        $dumpvars(0, dut);
	 
        // Initialize inputs
        Tin0 = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
        Tin1 = 128'hBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB;
        Tin2 = 128'hCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC;
        Tin3 = 128'hDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD;
        Tin4 = 128'hEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE;
        Tsel = 3'b000;

        // Apply test cases
        #10 Tsel = 3'b001; // Select in1
        #10 Tsel = 3'b010; // Select in2
        #10 Tsel = 3'b011; // Select in3
        #10 Tsel = 3'b100; // Select in4
        #10 Tsel = 3'b101; // Invalid case

        #10 $finish;
    end

endmodule
