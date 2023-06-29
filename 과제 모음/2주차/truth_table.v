`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/14 23:38:51
// Design Name: 
// Module Name: truth_table
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


module truth_table( //모듈 선언
    A, B, C,
    Y
    );

input A, B, C; //초기 입력값
output Y; //최종 output

wire a1, c1; //A,B의 AND 연산 값을 담는 a1, A,C의 NOR 연산을 담는 c1

and (a1, A, B); //A와 B를 AND 연산한 값을 a1에 저장
nor (c1, A, C); //A와 C를 NOR 연산한 값을 c1에 저장
or (Y, a1, c1); //a1과 c1을 OR 연산한 값을 Y에 저장

endmodule 
