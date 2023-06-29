`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/14 23:55:50
// Design Name: 
// Module Name: tb_truth_table
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


module tb_truth_table; //�׽��׺�ġ ��� ����
reg A, B, C; //input���� ����� A,B,C
wire Y; //output���� ����� Y
    
initial begin //����
    A=0; B=0; C=0; //0ns�� �� A=0 B=0 C=0
    #5 C=1; //5ns�� �� A=0 B=0 C=1
    #5 B=1;C=0; //10ns�� �� A=0 B=1 C=0
    #5 C=1; //15ns�� �� A=0 B=1 C=1
    #5 A=1;B=0;C=0; //20ns�� �� A=1 B=0 C=0
    #5 C=1; //25ns�� �� A=1 B=0 C=1
    #5 B=1;C=0; //30ns�� �� A=1 B=1 C=0
    #5 C=1; //35ns�� �� A=1 B=1 C=1
end

truth_table DUT(.A(A), .B(B), .C(C), .Y(Y)); //truth_table ��⿡ ���� �����Ͽ� �׽�Ʈ
    
endmodule
