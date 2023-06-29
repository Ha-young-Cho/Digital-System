`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/06 21:43:51
// Design Name: 
// Module Name: thermometer_encoder_7bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module thermometer_encoder_7bit( //��� ����
    decimal, therm, enable, out
);

input [2:0] decimal; //3bit input. 0~7������ ��
input enable; //1bit input
output reg [6:0] therm; //7bit output
output [2:0] out; //3bit output

always @({decimal}) begin //decimal���� ��ȭ�ϸ� ����
    // 0~7������ ���� 7bit thermometer code�� ��ȯ
    case({decimal})
        3'b000: therm = 7'b0000000; // 10���� 0 (3bit 000)�� 7bit�� ��ȯ
        3'b001: therm = 7'b0000001; // 10���� 1 (3bit 001)�� 7bit�� ��ȯ
        3'b010: therm = 7'b0000011; // 10���� 2 (3bit 010)�� 7bit�� ��ȯ
        3'b011: therm = 7'b0000111; // 10���� 3 (3bit 011)�� 7bit�� ��ȯ
        3'b100: therm = 7'b0001111; // 10���� 4 (3bit 100)�� 7bit�� ��ȯ
        3'b101: therm = 7'b0011111; // 10���� 5 (3bit 101)�� 7bit�� ��ȯ
        3'b110: therm = 7'b0111111; // 10���� 6 (3bit 110)�� 7bit�� ��ȯ
        3'b111: therm = 7'b1111111; // 10���� 7 (3bit 111)�� 7bit�� ��ȯ
    endcase
end

//graycode_encoder_3bit ��⿡ ���� ����
graycode_encoder_3bit GE(enable, therm, out);

endmodule
