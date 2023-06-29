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
input [2:0] WriteReg; //3bit의 데이터 저장 주소
input [15:0] WriteData; //16bit의 저장할 데이터
output [15:0] Max, Min; //read한 값의 최댓값, 최솟값
output Valid; //모든 숫자에 대해 비교가 끝남을 의미

//모듈을 연결하는 데 사용되는 wire
wire [2:0] ReadRegEven, ReadRegOdd;
wire [15:0] ReadDataEven, ReadDataOdd;
wire Start;

//각 모듈에 값을 전달하여 4개의 모듈을 연결
Counter_Red CR(clk, WriteEn, Start);
Counter_Blue CB(Start, clk, ReadRegEven, ReadRegOdd);
RegisterFile RF(WriteEn, WriteReg, WriteData, ReadRegEven, ReadRegOdd, clk, ReadDataEven, ReadDataOdd);
Min_Max_Finder MMF(Start, clk, ReadDataEven, ReadDataOdd, Max, Min, Valid);

endmodule
