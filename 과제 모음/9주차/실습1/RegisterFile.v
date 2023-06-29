`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 19:54:42
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile( 
    WriteRegA, WriteDataA, WriteEnA, ReadRegA1, ReadRegA2, WriteRegB, WriteDataB, WriteEnB, ReadRegB, clk, rst, start,
    out1, out2
);

input [2:0] WriteRegA; //3bit�� ������ ���� �ּ�
input [3:0] WriteDataA; //4bit�� ������ ������
input WriteEnA; //1bit input
input [2:0] ReadRegA1, ReadRegA2; //3bit�� read�� ������ �ּ�
input [3:0] WriteRegB; //4bit�� ������ ���� �ּ�
input [7:0] WriteDataB; //8bit�� ������ ������
input WriteEnB; //1bit input
input [3:0] ReadRegB; //4bit�� read�� ������ �ּ�
input clk, rst, start; //1bit input
output [3:0] out1, out2; //4bit ���� output

//HalfAdder_4bit, comparator�� �����ϴ� wire
wire [3:0] ReadDataA1, ReadDataA2; 
wire [7:0] ReadDataB;
//Quantization�� �����ϴ� wire
wire [3:0] sum;
wire c_out;

//�� ��⿡ ���� ����
RegisterFileA Register_File_A (WriteRegA, WriteDataA, WriteEnA, ReadRegA1, ReadRegA2, clk, rst, ReadDataA1, ReadDataA2);
RegisterFileB Register_File_B (WriteRegB, WriteDataB, WriteEnB, ReadRegB, clk, rst, ReadDataB);

HalfAdder_4bit HA(ReadDataA1, ReadDataB[7:4], start, sum, c_out);

Comparator C(ReadDataA2, ReadDataB[3:0], start, out2);

Quantization Q(sum, c_out, out1);

endmodule
