`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/06 19:33:48
// Design Name: 
// Module Name: tb_updown_counter_4bit
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


module tb_updown_counter_4bit; //�׽�Ʈ��ġ ����

reg [3:0] data; //4bit input
reg load, enable, select; //1bit input
reg clk, rst_n; //1bit input
wire [3:0] out; //4bit output

initial begin //�ʱⰪ ����
    data = 4'b0100;
    clk = 1'b1;
    rst_n = 1'b1;
    load = 1'b1;
    select = 1'b0;
    enable = 1'b0;
    #10 load = 1'b0; //10ns �� load �� ��ȭ
end

always #5 clk <= ~clk; //5ns���� clk ���� ������Ŵ
always #120 rst_n <= ~rst_n; //120ns���� rst_n ���� ������Ŵ
always #100 load <= ~load; //100ns���� load ���� ������Ŵ
always #30 enable <= ~enable; //30ns���� enable ���� ������Ŵ
always #60 select <= ~select; //60ns���� select ���� ������Ŵ

//updown_counter_4bit ��⿡ ���� �����Ͽ� �ùķ��̼�
updown_counter_4bit UC(clk, rst_n, data, load, enable, select, out);

endmodule
