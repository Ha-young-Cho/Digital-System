`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 20:06:28
// Design Name: 
// Module Name: RegisterFileA
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


module RegisterFileA(
     WriteRegA, WriteDataA, WriteEnA, ReadRegA1, ReadRegA2, clk, rst,
     ReadDataA1, ReadDataA2
);

input [2:0] WriteRegA; //3bit의 데이터 저장 주소
input [3:0] WriteDataA; //4bit의 저장할 데이터
input WriteEnA; //1bit input
input [2:0] ReadRegA1, ReadRegA2; //3bit의 read할 데이터 주소
input clk, rst; //1bit input
output [3:0] ReadDataA1, ReadDataA2; //4bit의 read할 데이터

reg [3:0] reg_file [0:7]; // 4bit의 reg 타입이 8bit 있는 벡터 (register file table)

//ReadRegA1과 ReadRegA2 위치의 데이터 2개 read
assign ReadDataA1 = reg_file[ReadRegA1];
assign ReadDataA2 = reg_file[ReadRegA2];

//clk가 상승 엣지거나 rst가 하강 엣지일 때 동작
always @(posedge clk or negedge rst) begin
    if(!rst) begin //rst가 0일 때 reg_file을 아래와 같이 초기화
        reg_file[0] = 4'h0000;
        reg_file[1] = 4'h0001;
        reg_file[2] = 4'h0002;
        reg_file[3] = 4'h0003;
        reg_file[4] = 4'h0004;
        reg_file[5] = 4'h0005;
        reg_file[6] = 4'h0006;
        reg_file[7] = 4'h0007;
    end
    //WriteEnA가 1일 때, WriteDataA를 write
    else if(WriteEnA) reg_file[WriteRegA] <= WriteDataA;
end

endmodule
