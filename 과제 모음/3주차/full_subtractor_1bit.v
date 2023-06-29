`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/24 00:45:01
// Design Name: 
// Module Name: full_subtractor_1bit
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


module full_subtractor_1bit( //모듈 선언
    a, b, b_in,
    d, b_out
    );
    
input a, b, b_in;
output d, b_out;
wire w1, w2, w3; 
//첫번째 half_subtractor의 xor 연산 값을 담는 w1
//첫번째 half_subtractor의 and 연산 값을 담는 w2
//두번째 half_subtractor의 and 연산 값을 담는 w3

//2개의 half_subtractor를 연결
half_subtractor_1bit hs1(a,b,w1,w2);
half_subtractor_1bit hs2(w1,b_in,d,w3);
or (b_out, w2, w3); //w2와 w3의 or연산값을 b_out에 저장

endmodule
