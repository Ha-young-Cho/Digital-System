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


module Muxed_Galois_LFSR( //��� ����
    clk, arst_n, r, L, LFSR
);

input clk;
input arst_n;
input [2:0] r;
input L;
output reg [2:0] LFSR;

wire [2:0] D; //mux ����� ���� wire

//clk�� ��� �����ų� arst_n�� �ϰ� ������ �� ����
always @(posedge clk or negedge arst_n) begin
    if(!arst_n) LFSR <= 0; //�ʱ�ȭ ��
    else LFSR <= D;
end

//L�� 1�̸� D�� r��, L�� 0�̸� D�� {}���� �Ҵ� : MUX ����
assign D = L ? r : {LFSR[2]^LFSR[1], LFSR[0], LFSR[2]};

endmodule
