`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/23 22:43:51
// Design Name: 
// Module Name: full_adder_16bit
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


module full_adder_16bit( //모듈 선언
    x, y, c_in,
    sum, c_out
    );
    
input [15:0] x, y; //16bit
input c_in; //1bit
output [15:0] sum; //16bit
output c_out; //1bit
wire c1, c2, c3; //4bit full adder의 c_out 값을 전달하는 wire

//4개의 4bit full adder로 설계
full_adder_4bit fa4_1 (x[3:0],y[3:0],c_in,sum[3:0],c1);
full_adder_4bit fa4_2 (x[7:4],y[7:4],c1,sum[7:4],c2);
full_adder_4bit fa4_3 (x[11:8],y[11:8],c2,sum[11:8],c3);
full_adder_4bit fa4_4 (x[15:12],y[15:12],c3,sum[15:12],c_out);

endmodule
