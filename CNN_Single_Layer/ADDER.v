`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 15:19:48
// Design Name: 
// Module Name: ADDER
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
 
module ADDER( //register file로부터 3개의 값을 입력 받아 덧셈 연산을 수행하는 모듈
    clk, rst_n, data1, data2, data3, 
    out
);

input clk, rst_n; //1bit input
input [7:0] data1, data2, data3; //8bit input
output reg [9:0] out; //10bit output

//clk가 상승엣지거나 rst_n이 하강엣지일 때 동작
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) out <= 0; //rst_n이 0일 때
    else out <= data1 + data2 + data3; //rst_n이 1일 때, 3개의 값 더하기
end

endmodule
