`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/03 17:57:55
// Design Name: 
// Module Name: Total_RegisterFile
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


module Total_RegisterFile(
    clk, WriteEn, WriteReg, WriteData, 
    Max, Min, Valid
);

input clk; //1bit input
input WriteEn; //1bit input
input [2:0] WriteReg; //3bit�� ������ ���� �ּ�
input [15:0] WriteData; //16bit�� ������ ������
output [15:0] Max, Min; //read�� ���� �ִ�, �ּڰ�
output Valid; //��� ���ڿ� ���� �񱳰� ������ �ǹ�

//����� �����ϴ� �� ���Ǵ� wire
wire [2:0] ReadRegEven, ReadRegOdd;
wire [15:0] ReadDataEven, ReadDataOdd;
wire Start;

//�� ��⿡ ���� �����Ͽ� 4���� ����� ����
Counter_Red CR(clk, WriteEn, Start);
Counter_Blue CB(Start, clk, ReadRegEven, ReadRegOdd);
RegisterFile RF(WriteEn, WriteReg, WriteData, ReadRegEven, ReadRegOdd, clk, ReadDataEven, ReadDataOdd);
Min_Max_Finder MMF(Start, clk, ReadDataEven, ReadDataOdd, Max, Min, Valid);

endmodule
