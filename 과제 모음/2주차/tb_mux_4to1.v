`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/15 01:18:21
// Design Name: 
// Module Name: tb_mux_4to1
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


module tb_mux_4to1; //�׽�Ʈ��ġ ��� ����

reg A, B, C, D, s0, s1; //input���� ����� A, B, C, D, s0, s1
wire out; //output���� ����� out

initial begin //����
    A = 1; B = 0; C = 1; D = 0; s0 = 0; s1 = 0; //0ns�� �� �ʱⰪ
    #5 s0 = 1; s1 = 0; //5ns�� �� s0=1 s1=0
    #5 s0 = 0; s1 = 1; //10ns�� �� s0=0 s1=1
    #5 s0 = 1; s1 = 1; //15ns�� �� s0=1 s1=1
end

mux_4to1 DUT(.A(A), .B(B), .C(C), .D(D), .s0(s0), .s1(s1), .out(out));
//mux_4to1 ��⿡ ���� �����Ͽ� �׽�Ʈ
   
endmodule
