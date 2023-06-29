`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/06 21:17:48
// Design Name: 
// Module Name: graycode_encoder_3bit
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


module graycode_encoder_3bit( //��� ����
    enable, therm, out
);

input enable; //1bit input
input [6:0] therm; //7bit input
output reg [2:0] out; //3bit output

always @({therm} or enable) begin //therm Ȥ�� enable�� ��ȭ�ϸ� ����
    // 3bit gray code�� ��ȯ
    if(enable == 1'b0) out = 3'b000; //enable�� 0�̸� out�� 0
    else begin //enable�� 1�� ��
        case({therm}) //�� thermometer code�� gray code�� ��ȯ
            7'b0000000: out = 3'b000;
            7'b0000001: out = 3'b001;
            7'b0000011: out = 3'b011;
            7'b0000111: out = 3'b010;
            7'b0001111: out = 3'b110;
            7'b0011111: out = 3'b111;
            7'b0111111: out = 3'b101;
            7'b1111111: out = 3'b100;
        endcase
    end
end

endmodule
