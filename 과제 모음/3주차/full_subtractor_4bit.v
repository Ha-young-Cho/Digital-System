`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/24 00:45:30
// Design Name: 
// Module Name: full_subtractor_4bit
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


module full_subtractor_4bit( //모듈 선언
    a, b, b_in,
    d, b_out, V
    );

input [3:0] a, b; //4bit input
input b_in; //1bit
output [3:0] d; //4bit output
output b_out; //1bit
output V; //overflow detection
wire w1, w2, w3; 
//1bit full subtractor의 연산값을 다음 subtractor로 전달할 때 사용하는 wire

//4개의 1bit full subtractor를 연결하여 설계
full_subtractor_1bit fs1(a[0], b[0], b_in, d[0], w1);
full_subtractor_1bit fs2(a[1], b[1], w1, d[1], w2);
full_subtractor_1bit fs3(a[2], b[2], w2, d[2], w3);
full_subtractor_1bit fs4(a[3], b[3], w3, d[3], b_out);

xor (V, w3, b_out); //w3과 b_out의 xor 연산값을 V에 저장

endmodule
