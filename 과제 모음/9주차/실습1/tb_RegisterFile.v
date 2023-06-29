`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 20:44:19
// Design Name: 
// Module Name: tb_RegisterFile
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


module tb_RegisterFile;

reg [2:0] WriteRegA; //3bit�� ������ ���� �ּ�
reg [3:0] WriteDataA; //4bit�� ������ ������
reg WriteEnA; //1bit input
reg [2:0] ReadRegA1, ReadRegA2; //3bit�� read�� ������ �ּ�
reg [3:0] WriteRegB; //4bit�� ������ ���� �ּ�
reg [7:0] WriteDataB; //8bit�� ������ ������
reg WriteEnB; //1bit input
reg [3:0] ReadRegB; //4bit�� read�� ������ �ּ�
reg clk, rst, start; //1bit input
wire [3:0] out1, out2; //4bit ���� output

initial begin //�ʱⰪ ����
    rst=1'b0; clk=1'b1; start=0; WriteEnA=0; WriteEnB=0; ReadRegA1=0; ReadRegA2=0; ReadRegB=0; 
    WriteRegA=0; WriteRegB=0; WriteDataA=0; WriteDataB=0;
    #10 rst=1'b1; start = 1'b1; ReadRegA1=3'h3; ReadRegA2=3'h5; ReadRegB=4'h4; //������ 3�� read
    #10 WriteEnA = 1'b1; WriteEnB = 1'b1; WriteRegA=3'h3; WriteRegB=4'h4; WriteDataA=4'hf; WriteDataB=8'hff; //������ 2�� write
    #10 WriteRegA=3'h5; WriteRegB=4'h6; WriteDataA=4'h8; WriteDataB=8'ha; //������ 2�� write
    #10 WriteEnA = 1'b0; WriteEnB = 1'b0; ReadRegA1=3'h3; ReadRegA2=3'h5; ReadRegB=4'h6; //������ 3�� read
    #20 $finish;
end

always #5 clk <= ~clk; //5ns���� clk �� ����

//��⿡ ���� ����
RegisterFile RF (WriteRegA, WriteDataA, WriteEnA, ReadRegA1, ReadRegA2, WriteRegB, WriteDataB, WriteEnB, ReadRegB, clk, rst, start, out1, out2);

endmodule
