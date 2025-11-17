module Cipher_FSM (
    input wire clk,
    input wire reset_n,
    output reg WR_EN_IN_REG,
    output reg WR_EN_STATE_REG,
    output reg WR_EN_OUT_REG,
    output reg [2:0] Sel_State,
    output reg [3:0] Sel_Key,
    output reg OUT_VAL
);

    // Define state encoding (10-bit state register)
    reg [11:0] state;
    reg [11:0] next_state;


    // Sequential logic: State transition on clock edge
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) 
            state <= 12'b000000000000;  // Reset to IDLE state
        else 
            state <= next_state;
    end
	 
	 
	 always @(*) begin
			case(state[9:7])
					//START
					3'b000: next_state = {state[11:10], 10'b0010000000};
					
					//ARK
					3'b001: begin
							//ITERATION
							case(state[6:3])
									//ITERATION 0
									4'b0000: begin
											case(state[2:0])
													3'b000: next_state = {state[11:10], 10'b0010000001};
													default: next_state = {state[11:10], 10'b0100001000};
											endcase
									end
									
									//ITERATION 10
									4'b1010: next_state = {state[11] | state[10], 11'b10000000000};
									
									//any other
									default: next_state = {state[11:10], 3'b010, state[6:3] + 4'b0001, 3'b000};				
							endcase
					end
							
					//SB
					3'b010: begin
							case(state[2:0])
									//Last cycle (6th)
									3'b101: next_state = {state[11:10], 3'b011, state[6:3], 3'b000};
									
									default: next_state = {state[11:10], 3'b010, state[6:3], state[2:0] + 3'b001};
							endcase
					
					end
					
					//SR
					3'b011: begin
							case(state[6:3])
									4'b1010: next_state = {state[11:10], 10'b0011010000};
									
									default: next_state = {state[11:10], 3'b100, state[6:3], 3'b000};
							endcase
					end
					
					//MC
					3'b100: begin
							case(state[2:0])
									//Last cycle (5th)
									3'b100: next_state = {state[11:10], 3'b001, state[6:3], 3'b000};
									
									default: next_state = {state[11:10], 3'b100, state[6:3], state[2:0] + 3'b001};
							endcase
					end
			
					default: next_state = 12'b000000000000;
	      endcase
	 end
	 
	 always @(*) begin
			case(state[9:7])
					3'b000: begin
							  WR_EN_IN_REG = 1'b1;
							  WR_EN_STATE_REG = 1'b1;
							  WR_EN_OUT_REG = 1'b0;
							  Sel_State = 3'b000;
							  Sel_Key = state[6:3];
							  OUT_VAL = state[10] & state[11];
					end
					
					3'b001: begin
							case(state[6:0])
								7'b0000000: begin
										WR_EN_IN_REG = 1'b1;
										WR_EN_STATE_REG = 1'b0;
										WR_EN_OUT_REG = 1'b0;
										Sel_State = 3'b100;
										Sel_Key = state[6:3];
										OUT_VAL = state[10] & state[11];
								end
								
								7'b1010000: begin
										WR_EN_IN_REG = 1'b1;
										WR_EN_STATE_REG = 1'b0;
										WR_EN_OUT_REG = 1'b1;
										Sel_State = 3'b100;
										Sel_Key = state[6:3];
										OUT_VAL = state[10] & state[11];
								end
								
								default: begin
										WR_EN_IN_REG = 1'b1;
										WR_EN_STATE_REG = 1'b1;
										WR_EN_OUT_REG = 1'b0;
										Sel_State = 3'b100;
										Sel_Key = state[6:3];
										OUT_VAL = state[10] & state[11];
								end
							endcase
					end
					
					3'b010: begin
							case(state[2:0])
								3'b101: begin
										WR_EN_IN_REG = 1'b1;
										WR_EN_STATE_REG = 1'b1;
										WR_EN_OUT_REG = 1'b0;
										Sel_State = 3'b001;
										Sel_Key = state[6:3];
										OUT_VAL = state[10] & state[11];
								end
								
								default: begin
										WR_EN_IN_REG = 1'b1;
										WR_EN_STATE_REG = 1'b0;
										WR_EN_OUT_REG = 1'b0;
										Sel_State = 3'b001;
										Sel_Key = state[6:3];
										OUT_VAL = state[10] & state[11];
								end
							endcase
					end
					
					3'b011: begin
							  WR_EN_IN_REG = 1'b1;
							  WR_EN_STATE_REG = 1'b1;
							  WR_EN_OUT_REG = 1'b0;
							  Sel_State = 3'b010;
							  Sel_Key = state[6:3];
							  OUT_VAL = state[10] & state[11];
					end
					
					3'b100: begin
							case(state[2:0])
								3'b100: begin
										WR_EN_IN_REG = 1'b1;
										WR_EN_STATE_REG = 1'b1;
										WR_EN_OUT_REG = 1'b0;
										Sel_State = 3'b011;
										Sel_Key = state[6:3];
										OUT_VAL = state[10] & state[11];
								end
								
								default: begin
										WR_EN_IN_REG = 1'b1;
										WR_EN_STATE_REG = 1'b0;
										WR_EN_OUT_REG = 1'b0;
										Sel_State = 3'b011;
										Sel_Key = state[6:3];
										OUT_VAL = state[10] & state[11];
								end
							endcase
					end
					
					default: begin
							  WR_EN_IN_REG = 1'b0;
							  WR_EN_STATE_REG = 1'b0;
							  WR_EN_OUT_REG = 1'b0;
							  Sel_State = 3'b000;
							  Sel_Key = state[6:3];
							  OUT_VAL = 1'b0;
					end
			endcase
	 end
	 
endmodule
