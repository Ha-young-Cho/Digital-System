`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/25 21:17:42
// Design Name: 
// Module Name: Galois_LFSR
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


module Galois_LFSR( //모듈 선언
    clk, arst_n, LFSR
);

parameter BITWIDTH = 5; //파라미터로 bit 설정
input clk;
input arst_n;
output reg [BITWIDTH-1:0] LFSR; //5bit output

//clk가 상승 엣지거나 arst_n이 하강 엣지일 때 동작
always @(posedge clk or negedge arst_n) begin
    if(!arst_n) LFSR <= 1; //초기화 값은 1로 설정
    else LFSR <= {LFSR[2]^LFSR[0], LFSR[4], LFSR[3], LFSR[2], LFSR[1]};
end

endmodule
