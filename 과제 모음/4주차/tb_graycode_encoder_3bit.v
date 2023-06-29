`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/06 21:18:33
// Design Name: 
// Module Name: tb_graycode_encoder_3bit
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


module tb_graycode_encoder_3bit; //�׽�Ʈ��ġ ����

reg [2:0] decimal; //3bit input. 0~7������ ��
reg enable; //1bit input
wire [6:0] therm; //7bit output���� input
wire [2:0] out; //3bit output

initial begin //�ʱⰪ ����
    decimal = 3'b011;
    enable = 1'b1;
    //therm = 7'b0000000;
    //out = 3'b000;
end

always #10 decimal = decimal + 3'b001; //10ns���� decimal�� 3'b001�� ����
always #20 enable = ~enable; //20ns���� enable ���� ������Ŵ

//thermometer_encoder_7bit ��⿡ ���� �����Ͽ� �ùķ��̼�
thermometer_encoder_7bit TE(decimal, therm, enable, out);

endmodule
