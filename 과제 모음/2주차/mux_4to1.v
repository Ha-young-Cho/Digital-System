`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/15 01:12:56
// Design Name: 
// Module Name: mux_4to1
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


module mux_4to1( //모듈 선언
    A, B, C, D,
    s0, s1,
    out
    );
    
input A, B, C, D, s0, s1; //입력값
output out; //최종 output

wire a, b, c, d, s0n, s1n;
//각 AND 연산한 값을 담는 a, b, c, d
//각 NOT 연산한 값을 담는 s0n, s1n

not(s1n, s1);//s1에 NOT 연산한 값을 s1n에 저장
not(s0n, s0);//s0에 NOT 연산한 값을 s0n에 저장

and (a, A, s1n, s0n);//A, s1n, s0n을 AND 연산한 값을 a에 저장
and (b, B, s1n, s0);//B, s1n, s0을 AND 연산한 값을 b에 저장
and (c, C, s1, s0n);//C, s1, s0n을 AND 연산한 값을 c에 저장
and (d, D, s1, s0);//D s1, s0을 AND 연산한 값을 d에 저장

or (out, a, b, c, d); //a, b, c, d를 or 연산한 값을 out에 저장

endmodule
