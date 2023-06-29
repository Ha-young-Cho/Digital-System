`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 20:36:04
// Design Name: 
// Module Name: HalfAdder_4bit
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


module HalfAdder_4bit(
    ReadDataA1, ReadDataB, start,
    sum, c_out
);

input [3:0] ReadDataA1; //4bit의 read할 데이터
input [7:4] ReadDataB; //4bit의 read할 데이터
input start; //1bit의 input
output reg [3:0] sum; //덧셈 결과
output reg c_out; //덧셈 자리 올림
reg [4:0] temp; //덧셈 후 sum과 c_out을 구분하기 위한 임시 reg

initial begin //초기화
    sum = 4'b0000;
    c_out = 1'b0;
end

always @(*) begin
    if(start==1) begin //start 신호가 들어올 때
        temp <= ReadDataA1 + ReadDataB; //덧셈
        sum <= temp[3:0]; //결과 저장
        c_out <= temp[4]; //결과 저장
    end
    else begin //start 신호가 들어오지 않을 때
        sum <= sum;
        c_out <= c_out;
    end
end

endmodule
