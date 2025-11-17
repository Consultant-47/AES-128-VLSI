module BlockRegister(CLK, RST_N, WR_EN, block_in, block_out);
    input wire CLK, RST_N, WR_EN;
    input wire [127:0] block_in;
    output reg [127:0] block_out;

    always @(posedge CLK or negedge RST_N)
    begin
        if(RST_N == 1'b0)
            block_out <= 127'b0;
        else if(WR_EN == 1'b1)
            block_out <= block_in;
    end
endmodule