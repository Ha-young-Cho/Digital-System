`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/24 00:39:22
// Design Name: 
// Module Name: half_subtractor_1bit
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


module half_subtractor_1bit( //모듈 선언
    a, b,
    d, b_out
    );

input a, b;
output d, b_out;

xor(d, a, b); // a와 b의 xor 연산값을 d에 저장
and(b_out, ~a, b); // (~a)와 b의 and 연산값을 b_out에 저장

endmodule
