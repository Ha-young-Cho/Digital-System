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

input Start; //1bit input
input [3:0] din0; //4bit input
input [3:0] din1; //4bit input
output reg [7:0] dout; //8bit output

always @(*) begin //아래 모든 신호 중 하나라도 값이 변하면 실행
    //Start가 1이면, Image와 Filter의 곱셈 연산 수행
    if(Start) dout = din0 * din1;
    else dout = 8'b0; //Start가 0일 때
end

endmodule
