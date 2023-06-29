`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/03 17:37:37
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
    WriteEn, WriteReg, WriteData, ReadRegEven, ReadRegOdd, clk,
    ReadDataEven, ReadDataOdd
);

input clk; //1bit input
input WriteEn; //1bit input
input [2:0] WriteReg; //3bit의 데이터 저장 주소
input [15:0] WriteData; //16bit의 저장할 데이터
input [2:0] ReadRegEven, ReadRegOdd; //홀수와 짝수 주소를 가리키는 신호
output [15:0] ReadDataEven, ReadDataOdd; //위 신호가 가리키는 데이터

reg [15:0] reg_file [0:7]; //bit width 16, word 8

//ReadRegEven, ReadRegOdd 위치의 데이터 2개 read
assign ReadDataEven = reg_file[ReadRegEven];
assign ReadDataOdd = reg_file[ReadRegOdd];

always @(posedge clk) begin //clk가 상승 엣지일 때 동작
    //WriteEn이 1이면 WriteData를 write
    if(WriteEn) reg_file[WriteReg] <= WriteData;
end

endmodule
