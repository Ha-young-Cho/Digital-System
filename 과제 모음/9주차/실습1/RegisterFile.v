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

input [2:0] WriteRegA; //3bit의 데이터 저장 주소
input [3:0] WriteDataA; //4bit의 저장할 데이터
input WriteEnA; //1bit input
input [2:0] ReadRegA1, ReadRegA2; //3bit의 read할 데이터 주소
input [3:0] WriteRegB; //4bit의 데이터 저장 주소
input [7:0] WriteDataB; //8bit의 저장할 데이터
input WriteEnB; //1bit input
input [3:0] ReadRegB; //4bit의 read할 데이터 주소
input clk, rst, start; //1bit input
output [3:0] out1, out2; //4bit 최종 output

//HalfAdder_4bit, comparator에 전달하는 wire
wire [3:0] ReadDataA1, ReadDataA2; 
wire [7:0] ReadDataB;
//Quantization에 전달하는 wire
wire [3:0] sum;
wire c_out;

//각 모듈에 값을 전달
RegisterFileA Register_File_A (WriteRegA, WriteDataA, WriteEnA, ReadRegA1, ReadRegA2, clk, rst, ReadDataA1, ReadDataA2);
RegisterFileB Register_File_B (WriteRegB, WriteDataB, WriteEnB, ReadRegB, clk, rst, ReadDataB);

HalfAdder_4bit HA(ReadDataA1, ReadDataB[7:4], start, sum, c_out);

Comparator C(ReadDataA2, ReadDataB[3:0], start, out2);

Quantization Q(sum, c_out, out1);

endmodule
