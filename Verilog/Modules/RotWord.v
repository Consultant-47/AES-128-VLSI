module RotWord(word, out_word);
    input [31:0] word;
    output [31:0] out_word;
    wire [7:0] in1, in2, in3, in4;

    assign in1 = word[31:24];
    assign in2 = word[23:16];
    assign in3 = word[15:8];
    assign in4 = word[7:0];
    
    assign out_word = {in2, in3, in4, in1};
endmodule