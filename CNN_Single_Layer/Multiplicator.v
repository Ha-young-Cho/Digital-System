`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 15:20:25
// Design Name: 
// Module Name: Multiplicator
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

module Multiplicator( //���� ������ �����ϴ� ���
    Start, din0, din1, dout
);

input Start; //1bit input
input [3:0] din0; //4bit input
input [3:0] din1; //4bit input
output reg [7:0] dout; //8bit output

always @(*) begin //�Ʒ� ��� ��ȣ �� �ϳ��� ���� ���ϸ� ����
    //Start�� 1�̸�, Image�� Filter�� ���� ���� ����
    if(Start) dout = din0 * din1;
    else dout = 8'b0; //Start�� 0�� ��
end

endmodule
