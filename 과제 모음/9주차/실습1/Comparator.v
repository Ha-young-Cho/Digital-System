`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 20:36:18
// Design Name: 
// Module Name: Comparator
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


module Comparator(
    ReadDataA2, ReadDataB, start,
    out2
);
    
input [3:0] ReadDataA2; //4bit�� read�� ������
input [3:0] ReadDataB; //4bit�� read�� ������
input start; //1bit input
output reg [3:0] out2; //�� �� �� ū ���� �����ϴ� output

initial begin //�ʱ�ȭ
    out2 = 4'b0000;
end

always @(*) begin
    if(start == 1) begin //start ��ȣ�� ���� ��
        // �� �������� ��� �� ��, �� ū ���� out2�� ����
        if(ReadDataA2 >= ReadDataB) out2 <= ReadDataA2;
        else out2 <= ReadDataB;
    end //start ��ȣ�� ������ ���� ��
    else out2 <= out2;
end
    
endmodule
