`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/24 00:45:01
// Design Name: 
// Module Name: full_subtractor_1bit
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


module full_subtractor_1bit( //��� ����
    a, b, b_in,
    d, b_out
    );
    
input a, b, b_in;
output d, b_out;
wire w1, w2, w3; 
//ù��° half_subtractor�� xor ���� ���� ��� w1
//ù��° half_subtractor�� and ���� ���� ��� w2
//�ι�° half_subtractor�� and ���� ���� ��� w3

//2���� half_subtractor�� ����
half_subtractor_1bit hs1(a,b,w1,w2);
half_subtractor_1bit hs2(w1,b_in,d,w3);
or (b_out, w2, w3); //w2�� w3�� or���갪�� b_out�� ����

endmodule
