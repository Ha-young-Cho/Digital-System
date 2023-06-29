`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/15 01:12:56
// Design Name: 
// Module Name: mux_4to1
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


module mux_4to1( //��� ����
    A, B, C, D,
    s0, s1,
    out
    );
    
input A, B, C, D, s0, s1; //�Է°�
output out; //���� output

wire a, b, c, d, s0n, s1n;
//�� AND ������ ���� ��� a, b, c, d
//�� NOT ������ ���� ��� s0n, s1n

not(s1n, s1);//s1�� NOT ������ ���� s1n�� ����
not(s0n, s0);//s0�� NOT ������ ���� s0n�� ����

and (a, A, s1n, s0n);//A, s1n, s0n�� AND ������ ���� a�� ����
and (b, B, s1n, s0);//B, s1n, s0�� AND ������ ���� b�� ����
and (c, C, s1, s0n);//C, s1, s0n�� AND ������ ���� c�� ����
and (d, D, s1, s0);//D s1, s0�� AND ������ ���� d�� ����

or (out, a, b, c, d); //a, b, c, d�� or ������ ���� out�� ����

endmodule
