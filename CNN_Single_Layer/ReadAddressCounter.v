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


module ReadAddressCounter( //register file에 저장된 곱셈 결과를 읽어올 때 필요한 주소를 계산
    clk, rst_n, ReadEn, 
    ReadReg
);

input clk, rst_n; //1bit input
input ReadEn; //1bit input
output [3:0] ReadReg; //4bit output
wire [14:0] count; //ring counter x3에서 address encoder로 값을 전달하기 위한 wire
parameter initReadReg = 0; //3개의 ReadReg 시작 숫자를 제어하기 위한 파라미터

//RingCounterX3와 AddressEncoder 모듈에 값 전달
RingCounterX3 #(.initCount(initReadReg)) ReadCounter (.clk(clk), .rst_n(rst_n), .en(ReadEn), .count(count));
AddressEncoder ReadAddress (.AddrIn(count), .AddrOut(ReadReg));

endmodule
