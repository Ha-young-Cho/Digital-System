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


module half_adder_1bit( //��� ����
    x, y,
    sum, c_out
    );

input x, y; //�ʱ� �Է°�
output sum, c_out; //���� output

xor (sum, x, y); // x�� y�� xor ������ ���� sum�� ����
and (c_out, x, y); // x�� y�� and ������ ���� c_out�� ����

endmodule
