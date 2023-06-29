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


module ReLU( //��� ����
    d_in, d_out
);

parameter RESULT = 10;
input signed [RESULT-1:0] d_in; //������ ������ input
output [RESULT-1:0] d_out; //output

//input�� 0���� ������ output�� 0, �ƴ� ��쿡�� d_out�� d_in
assign d_out = (d_in < 0 ? 0 : d_in);

endmodule
