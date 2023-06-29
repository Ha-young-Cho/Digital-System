`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 15:18:38
// Design Name: 
// Module Name: AddressCounter
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

module AddressCounter( //register file�� ���� �аų� ���� ���� �ּҸ� ����ϴ� ���
    clk, rst_n, Start, ReadEn, 
    WriteReg, ReadReg1, ReadReg2, ReadReg3
);

input clk, rst_n; //1bit input
input Start; //1bit input
input ReadEn; //1bit input
output [3:0] WriteReg; //write address�� ��� �ִ� 4bit output
output [3:0] ReadReg1, ReadReg2, ReadReg3; //read address�� ��� �ִ� 4bit output

//3���� read address�� ����ϴ� ���. �Ķ���� ���� ���� ����
ReadAddressCounter #(.initReadReg(0)) ReadAddress1 (.clk(clk), .rst_n(rst_n), .ReadEn(ReadEn), .ReadReg(ReadReg1)); 
ReadAddressCounter #(.initReadReg(1)) ReadAddress2 (.clk(clk), .rst_n(rst_n), .ReadEn(ReadEn), .ReadReg(ReadReg2));
ReadAddressCounter #(.initReadReg(2)) ReadAddress3 (.clk(clk), .rst_n(rst_n), .ReadEn(ReadEn), .ReadReg(ReadReg3));
//1���� write address�� ����ϴ� ���
WriteAddressCounter WriteAddress(.clk(clk), .rst_n(rst_n), .Start(Start), .WriteReg(WriteReg)); 

endmodule
