`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/23 22:44:13
// Design Name: 
// Module Name: full_adder_1bit
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


module full_adder_1bit( //모듈 선언
    x, y, c_in,
    sum, c_out
    );

input x, y, c_in; //초기 입력값
output sum, c_out; //최종 output
wire s1, c1, c2; 
//x와 y의 xor 연산 값을 담는 s1
//x와 y의 and 연산 값을 담는 c1
//c_in와 s1의 and 연산 값을 담는 c2

half_adder_1bit ha_1(x,y,s1,c1); //1bit half adder 2개로 구성
half_adder_1bit ha_2(c_in,s1,sum,c2);
or (c_out, c2, c1); //c2와 c1을 or 연산한 값을 c_out에 저장

endmodule
