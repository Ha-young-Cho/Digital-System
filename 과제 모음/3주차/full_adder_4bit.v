`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/23 22:41:29
// Design Name: 
// Module Name: full_adder_4bit
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


module full_adder_4bit( //모듈 선언
    x, y, c_in,
    sum, c_out
    );

input [3:0] x, y; //4bit
input c_in; //1bit
output [3:0] sum; //4bit
output c_out; //1bit
wire c1, c2, c3; //1bit full adder의 c_out을 전달하는 wire

//4개의 1bit full adder로 설계
full_adder_1bit fa_1 (x[0],y[0],c_in,sum[0],c1);
full_adder_1bit fa_2 (x[1],y[1],c1,sum[1],c2);
full_adder_1bit fa_3 (x[2],y[2],c2,sum[2],c3);
full_adder_1bit fa_4 (x[3],y[3],c3,sum[3],c_out);

endmodule
