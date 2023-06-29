`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 20:36:04
// Design Name: 
// Module Name: HalfAdder_4bit
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


module HalfAdder_4bit(
    ReadDataA1, ReadDataB, start,
    sum, c_out
);

input [3:0] ReadDataA1; //4bit�� read�� ������
input [7:4] ReadDataB; //4bit�� read�� ������
input start; //1bit�� input
output reg [3:0] sum; //���� ���
output reg c_out; //���� �ڸ� �ø�
reg [4:0] temp; //���� �� sum�� c_out�� �����ϱ� ���� �ӽ� reg

initial begin //�ʱ�ȭ
    sum = 4'b0000;
    c_out = 1'b0;
end

always @(*) begin
    if(start==1) begin //start ��ȣ�� ���� ��
        temp <= ReadDataA1 + ReadDataB; //����
        sum <= temp[3:0]; //��� ����
        c_out <= temp[4]; //��� ����
    end
    else begin //start ��ȣ�� ������ ���� ��
        sum <= sum;
        c_out <= c_out;
    end
end

endmodule
