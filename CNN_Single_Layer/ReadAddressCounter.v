`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 16:01:05
// Design Name: 
// Module Name: ReadAddressCounter
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


module ReadAddressCounter( //register file�� ����� ���� ����� �о�� �� �ʿ��� �ּҸ� ���
    clk, rst_n, ReadEn, 
    ReadReg
);

input clk, rst_n; //1bit input
input ReadEn; //1bit input
output [3:0] ReadReg; //4bit output
wire [14:0] count; //ring counter x3���� address encoder�� ���� �����ϱ� ���� wire
parameter initReadReg = 0; //3���� ReadReg ���� ���ڸ� �����ϱ� ���� �Ķ����

//RingCounterX3�� AddressEncoder ��⿡ �� ����
RingCounterX3 #(.initCount(initReadReg)) ReadCounter (.clk(clk), .rst_n(rst_n), .en(ReadEn), .count(count));
AddressEncoder ReadAddress (.AddrIn(count), .AddrOut(ReadReg));

endmodule