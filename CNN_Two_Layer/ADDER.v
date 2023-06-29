`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 15:19:48
// Design Name: 
// Module Name: ADDER
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
 
module ADDER( //register file�κ��� 3���� ���� �Է� �޾� ���� ������ �����ϴ� ���
    clk, rst_n, data1, data2, data3, 
    out
);

parameter DATAWIDTH = 8;
parameter RESULT = 10;

input clk, rst_n; //1bit input
input signed [DATAWIDTH-1:0] data1, data2, data3; //8bit input
output reg signed [RESULT-1:0] out; //10bit output

//clk�� ��¿����ų� rst_n�� �ϰ������� �� ����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) out <= 0; //rst_n�� 0�� ��
    else out <= data1 + data2 + data3; //rst_n�� 1�� ��, 3���� �� ���ϱ�
end

endmodule
