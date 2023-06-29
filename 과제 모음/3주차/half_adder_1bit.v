`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/23 22:45:01
// Design Name: 
// Module Name: half_adder_1bit
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


module half_adder_1bit( //모듈 선언
    x, y,
    sum, c_out
    );

input x, y; //초기 입력값
output sum, c_out; //최종 output

xor (sum, x, y); // x와 y를 xor 연산한 값을 sum에 저장
and (c_out, x, y); // x와 y를 and 연산한 값을 c_out에 저장

endmodule
