`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 16:00:47
// Design Name: 
// Module Name: WriteAddressCounter
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


module WriteAddressCounter( 
//multiplicator���� ��µ� ���� ����� register file�� ������ �� �ʿ��� �ּҸ� ���
    clk, rst_n, Start, 
    WriteReg
);

parameter ADDRESS = 4;
parameter DATAWIDTH = 8;
parameter DATANUM = 15;

input clk, rst_n; //1bit input
input Start; //1bit input
output [ADDRESS-1:0] WriteReg; //������ �� �ʿ��� �ּҸ� ��� 4bit output
wire [DATANUM-1:0] count; //ring counter���� address encoder�� ���� �����ϱ� ���� wire

//ring counter�� address encoder ��⿡ �� ����
RingCounter #(.DATANUM(DATANUM)) WriteCounter(.clk(clk), .rst_n(rst_n), .en(Start), .count(count));
AddressEncoder #(.DATANUM(DATANUM), .ADDRESS(ADDRESS)) WriteAddress(.AddrIn(count), .AddrOut(WriteReg));

endmodule
