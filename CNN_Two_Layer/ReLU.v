`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/16 12:27:08
// Design Name: 
// Module Name: ReLU
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


module ReLU( //모듈 선언
    d_in, d_out
);

parameter RESULT = 10;
input signed [RESULT-1:0] d_in; //음수가 가능한 input
output [RESULT-1:0] d_out; //output

//input이 0보다 작으면 output은 0, 아닐 경우에는 d_out에 d_in
assign d_out = (d_in < 0 ? 0 : d_in);

endmodule
