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
//multiplicator에서 출력된 곱셈 결과를 register file에 저장할 때 필요한 주소를 계산
    clk, rst_n, Start, 
    WriteReg
);

parameter ADDRESS = 4;
parameter DATAWIDTH = 8;
parameter DATANUM = 15;

input clk, rst_n; //1bit input
input Start; //1bit input
output [ADDRESS-1:0] WriteReg; //저장할 때 필요한 주소를 담는 4bit output
wire [DATANUM-1:0] count; //ring counter에서 address encoder로 값을 전달하기 위한 wire

//ring counter와 address encoder 모듈에 값 전달
RingCounter #(.DATANUM(DATANUM)) WriteCounter(.clk(clk), .rst_n(rst_n), .en(Start), .count(count));
AddressEncoder #(.DATANUM(DATANUM), .ADDRESS(ADDRESS)) WriteAddress(.AddrIn(count), .AddrOut(WriteReg));

endmodule
