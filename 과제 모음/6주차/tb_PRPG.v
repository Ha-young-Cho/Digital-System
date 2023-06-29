`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 03:59:33
// Design Name: 
// Module Name: tb_PRPG
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


module tb_PRPG; //�׽�Ʈ��ġ ����

reg clk, rst_n; // 1bit input
reg [0:n-1] seed; //���� ó�� �ʱⰪ
wire [0:n-1] qout; //shift register�� �����Ǵ� ��
wire sequence; //������ bit sequence
wire [0:n-1] count; //bit sequence���� 1�� ���� count
wire [0:n-1] num; //���� clk cycle���� ��Ÿ���� ���� 1�� ����
wire valid; //valid ��ȣ

parameter n = 4; //bit ���� �°� �ڵ尡 �����ϵ��� �Ķ���� ����

initial begin //�ʱⰪ ����
    seed = {n{1'b1}}; //��� bit�� 1�� ä���� seed
    clk = 1'b1;
    rst_n = 1'b0; //rst_n�� ���� �� �ʱ�ȭ
    #5 rst_n = 1'b1;
end

always #5 clk <= ~clk; // 5ns���� clk �� ����
always #200 rst_n <= ~rst_n; //50ns���� rst_n �� ����

//PRPG ��⿡ ���� �����Ͽ� �ùķ��̼�
PRPG prpg(clk, rst_n, seed, qout, sequence, count, num, valid);

endmodule
