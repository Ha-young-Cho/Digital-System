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

input clk, rst_n; //1bit input
input Start; //1bit input
output [3:0] WriteReg; //������ �� �ʿ��� �ּҸ� ��� 4bit output
wire [14:0] count; //ring counter���� address encoder�� ���� �����ϱ� ���� wire

//ring counter�� address encoder ��⿡ �� ����
RingCounter WriteCounter(.clk(clk), .rst_n(rst_n), .en(Start), .count(count));
AddressEncoder WriteAddress(.AddrIn(count), .AddrOut(WriteReg));

endmodule
