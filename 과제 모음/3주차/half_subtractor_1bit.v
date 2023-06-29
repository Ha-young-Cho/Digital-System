`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/24 00:39:22
// Design Name: 
// Module Name: half_subtractor_1bit
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


module half_subtractor_1bit( //��� ����
    a, b,
    d, b_out
    );

input a, b;
output d, b_out;

xor(d, a, b); // a�� b�� xor ���갪�� d�� ����
and(b_out, ~a, b); // (~a)�� b�� and ���갪�� b_out�� ����

endmodule
