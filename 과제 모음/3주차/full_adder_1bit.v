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


module full_adder_1bit( //��� ����
    x, y, c_in,
    sum, c_out
    );

input x, y, c_in; //�ʱ� �Է°�
output sum, c_out; //���� output
wire s1, c1, c2; 
//x�� y�� xor ���� ���� ��� s1
//x�� y�� and ���� ���� ��� c1
//c_in�� s1�� and ���� ���� ��� c2

half_adder_1bit ha_1(x,y,s1,c1); //1bit half adder 2���� ����
half_adder_1bit ha_2(c_in,s1,sum,c2);
or (c_out, c2, c1); //c2�� c1�� or ������ ���� c_out�� ����

endmodule
