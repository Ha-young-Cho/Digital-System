`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/14 23:38:51
// Design Name: 
// Module Name: truth_table
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


module truth_table( //��� ����
    A, B, C,
    Y
    );

input A, B, C; //�ʱ� �Է°�
output Y; //���� output

wire a1, c1; //A,B�� AND ���� ���� ��� a1, A,C�� NOR ������ ��� c1

and (a1, A, B); //A�� B�� AND ������ ���� a1�� ����
nor (c1, A, C); //A�� C�� NOR ������ ���� c1�� ����
or (Y, a1, c1); //a1�� c1�� OR ������ ���� Y�� ����

endmodule 
