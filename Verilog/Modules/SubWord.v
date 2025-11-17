module SubWord(word, out_word);
    input [31:0] word;
    output [31:0] out_word;

    wire [7:0] byte0, byte1, byte2, byte3;
    wire [7:0] byte0_out, byte1_out, byte2_out, byte3_out;

    SubByte sub_byte0(word[7:0], byte0_out);
    SubByte sub_byte1(word[15:8], byte1_out);
    SubByte sub_byte2(word[23:16], byte2_out);
    SubByte sub_byte3(word[31:24], byte3_out);

    assign out_word = {byte3_out, byte2_out, byte1_out, byte0_out};
endmodule
