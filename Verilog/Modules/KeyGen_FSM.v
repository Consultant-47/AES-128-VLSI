module KeyGen_FSM (
		input wire clk,
		input wire reset_n,
		output wire EN,
		output wire sel,
		output wire [3:0] Rcon_index,
		output wire WR_EN_SR,
		output wire LD_SR,
		output wire WR_EN_KS,
		output wire WR_EN_IN_REG,
		output wire WR_EN_K0,
		output wire [3:0] index_KS,
		output wire [1:0] blk_no_KS
);

    // Define state encoding (6-bit state register)
    reg [7:0] state;
    reg [7:0] next_state;


    // Sequential logic: State transition on clock edge
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) 
            state <= 6'b000000;  // Reset to IDLE state
        else 
            state <= next_state;
    end
	 
	 
	 always @(*) begin
			case(state[7])
					1'b0: next_state = state + 8'b00000001;
					default: begin
							case(state[5:2])
									//START
									4'b0000: next_state = 8'b10000100;
									
									//SINK
									4'b1111: next_state = 8'b10111111;
									
									//FINAL key
									4'b1010: begin
											case(state[1:0])
													//FINAL word of FINAL key
													2'b11: next_state = 8'b10111111;
													
													//any other
													default: next_state = {6'b101010, state[1:0] + 2'b01};				
											endcase
									end
							
									default: begin
											case(state[1:0])
													//FINAL of this key
													2'b11: next_state = {state[7:2] + 4'b0001, 2'b00};
													
													//any other
													default: next_state = {state[7:2], state[1:0] + 2'b01};				
											endcase
									end
							endcase
					end	
			endcase		
	 end
	 
	 
		assign EN = ~(state[5] & state[4] & state[3] & state[2] & state[1] & state[0] & (state[7]) & ~state[6]);
		assign sel = ~(state[0] | state[1]);
		assign Rcon_index = state[5:2];
		assign WR_EN_SR = 1'b1;
		assign LD_SR = ~(state[5] | state[4] | state[3] | state[2] | state[1] | state[0]);
		assign WR_EN_KS = (state[5] | state[4] | state[3] | state[2] | state[1] | state[0]);
		assign WR_EN_IN_REG = ~state[7];
		assign WR_EN_K0 = ~(state[5] | state[4] | state[3] | state[2] | state[1] | state[0]);
		assign index_KS = state[5:2];
		assign blk_no_KS = state[1:0];
	 
endmodule
