`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/23 22:43:30
// Design Name: 
// Module Name: full_adder_32bit
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


module full_adder_32bit( //모듈 선언
    x, y, c_in,
    sum, c_out
    );
    
input [31:0] x, y; //32bit
input c_in; //1bit
output [31:0] sum; //32bit
output c_out; //1bit
wire c1; //16bit full adder의 c_out 값을 전달하는 wire

//2개의 16bit full adder로 설계
full_adder_16bit fa16_1 (x[15:0],y[15:0],c_in,sum[15:0],c1);
full_adder_16bit fa16_2 (x[31:16],y[31:16],c1,sum[31:16],c_out);
endmodule
