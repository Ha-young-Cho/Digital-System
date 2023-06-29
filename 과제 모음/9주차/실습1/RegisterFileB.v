`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 20:06:44
// Design Name: 
// Module Name: RegisterFileB
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


module RegisterFileB(
    WriteRegB, WriteDataB, WriteEnB, ReadRegB, clk, rst,
    ReadDataB
);

input [3:0] WriteRegB; //4bit의 데이터 저장 주소
input [7:0] WriteDataB; //8bit의 저장할 데이터
input WriteEnB; //1bit input
input [3:0] ReadRegB; //4bit의 read할 데이터 주소
input clk, rst; //1bit input
output [7:0] ReadDataB; //8bit의 read할 데이터

reg [7:0] reg_file [0:15]; // 8bit의 reg 타입이 16bit 있는 벡터 (register file table)

//ReadRegB 위치의 데이터 read
assign ReadDataB = reg_file[ReadRegB];

//clk가 상승 엣지거나 rst가 하강 엣지일 때 동작
always @(posedge clk or negedge rst) begin
    if(!rst) begin //rst가 0일 때 reg_file을 아래와 같이 초기화
        reg_file[0] = 8'h00000000;
        reg_file[1] = 8'h00000001;
        reg_file[2] = 8'h00000002;
        reg_file[3] = 8'h00000003;
        reg_file[4] = 8'h00000004;
        reg_file[5] = 8'h00000005;
        reg_file[6] = 8'h00000006;
        reg_file[7] = 8'h00000007;
        reg_file[8] = 8'h00000008;
        reg_file[9] = 8'h00000009;
        reg_file[10] = 8'h0000000a;
        reg_file[11] = 8'h0000000b;
        reg_file[12] = 8'h0000000c;
        reg_file[13] = 8'h0000000d;
        reg_file[14] = 8'h0000000e;
        reg_file[15] = 8'h0000000f;
    end
    //WriteEnB가 1일 때, WriteDataB를 write
    else if(WriteEnB) reg_file[WriteRegB] <= WriteDataB;
end

endmodule
