`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/04 21:03:28
// Design Name: 
// Module Name: tb_Total_RegisterFile
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


module tb_Total_RegisterFile; //�׽�Ʈ��ġ ����

reg clk; //1bit input
reg WriteEn; //1bit input
reg [2:0] WriteReg; //3bit�� ������ ���� �ּ�
reg [15:0] WriteData; //16bit�� ������ ������
wire [15:0] Max, Min; //read�� ���� �ִ�, �ּڰ�
wire Valid; //��� ���ڿ� ���� �񱳰� ������ �ǹ�

initial begin //8*16bit register file�� 10ns ������ ������ ����
    clk = 1'b1; WriteEn=1'b1; WriteReg=3'h0; WriteData=16'h0; 
    #10 WriteReg=3'h1; WriteData=16'h1;
    #10 WriteReg=3'h2; WriteData=16'h2; 
    #10 WriteReg=3'h3; WriteData=16'h3;
    #10 WriteReg=3'h4; WriteData=16'h4;
    #10 WriteReg=3'h5; WriteData=16'h5;
    #10 WriteReg=3'h6; WriteData=16'h6; 
    #10 WriteReg=3'h7; WriteData=16'h7;
    #10 WriteEn=1'b0;
end

always #5 clk <= ~clk; //5ns���� clk �� ����

//��⿡ �� ����
Total_RegisterFile TRF (clk, WriteEn, WriteReg, WriteData, Max, Min, Valid);

endmodule
