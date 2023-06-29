`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/25 21:42:04
// Design Name: 
// Module Name: Muxed_Galois_LFSR
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


module Muxed_Galois_LFSR( //모듈 선언
    clk, arst_n, r, L, LFSR
);

input clk;
input arst_n;
input [2:0] r;
input L;
output reg [2:0] LFSR;

wire [2:0] D; //mux 사용을 위한 wire

//clk가 상승 엣지거나 arst_n이 하강 엣지일 때 동작
always @(posedge clk or negedge arst_n) begin
    if(!arst_n) LFSR <= 0; //초기화 시
    else LFSR <= D;
end

//L이 1이면 D에 r을, L이 0이면 D에 {}값을 할당 : MUX 역할
assign D = L ? r : {LFSR[2]^LFSR[1], LFSR[0], LFSR[2]};

endmodule
