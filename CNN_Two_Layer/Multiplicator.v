`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 15:20:25
// Design Name: 
// Module Name: Multiplicator
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

module Multiplicator( //곱셈 연산을 수행하는 모듈
    Start, din0, din1, dout
);

parameter INPUT = 4;
parameter FILTER = 4;

input Start; //1bit input
input [INPUT-1:0] din0; //4bit input
input signed [INPUT-1:0] din1; //4bit input
output signed [INPUT+FILTER-1:0] dout; //8bit output

//Start가 1이면, Image와 Filter의 곱셈 연산 수행
assign dout = Start ? $signed({1'b0, din0}) * $signed(din1) : 0;

endmodule
