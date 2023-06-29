`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 01:55:51
// Design Name: 
// Module Name: tb_program_counter_nbit
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


module tb_program_counter_nbit; //�׽�Ʈ��ġ ����

reg clk, rst_n; //1bit input
reg [N-1:0] PCdata; //Nbit input
reg PCload, PCinc; //1bit input
wire [N-1:0] PCout; //Nbit output

parameter N = 32; //N���� �����ϴ� �Ķ����

initial begin //�ʱⰪ ����
    rst_n <= 1'b0; //rst_n�� ���� �ʱⰪ�� 0���� ����
    clk <= 1'b1;
    PCload <= 1'b1;
    PCinc <= 1'b1;
    PCdata <= 0;
    #5 rst_n <= 1'b1; PCload <= 1'b0;//5ns �� rst_n, PCload �� ����
end

always #5 clk <= ~clk; //5ns���� clk �� ����
always #50 rst_n <= ~rst_n; //50ns���� rst_n �� ����
always #30 PCload <= ~PCload; //30ns���� PCload �� ����
always #15 PCinc <= ~PCinc; //15ns���� PCinc �� ����
always #20 PCdata <= PCdata + 1;

//�ùķ��̼��� ���� program_counter_nbit�� �� ����
program_counter_nbit PC(clk, rst_n, PCdata, PCload, PCinc, PCout);

endmodule
