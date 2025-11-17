`timescale 1 ns / 1 ns

module main;
    reg [127:0] s_in;         // Changed b_in to reg
	 reg [127:0] k_in;
    wire [127:0] s_out;
    integer i;
    
    // Instantiate the DUT (Design Under Test)
    AddRoundKey dut(.state_in(s_in), .key_exp(k_in), .state_out(s_out));
    
    initial 
    begin        
        s_in = 128'h046681e5e0cb199a48f8d37a2806264c;       // No need for 'assign'
		  k_in = 128'ha0fafe1788542cb123a339392a6c7605;
        #10;
        $display("s_in = %h, key = %h, s_out = %h", s_in, k_in, s_out);
        $finish;
    end
    
    initial
    begin
        $dumpfile("waveforms.vcd");
        $dumpvars(0, dut);
    end
endmodule