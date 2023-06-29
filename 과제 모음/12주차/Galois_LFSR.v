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


module Galois_LFSR( //��� ����
    clk, arst_n, LFSR
);

parameter BITWIDTH = 5; //�Ķ���ͷ� bit ����
input clk;
input arst_n;
output reg [BITWIDTH-1:0] LFSR; //5bit output

//clk�� ��� �����ų� arst_n�� �ϰ� ������ �� ����
always @(posedge clk or negedge arst_n) begin
    if(!arst_n) LFSR <= 1; //�ʱ�ȭ ���� 1�� ����
    else LFSR <= {LFSR[2]^LFSR[0], LFSR[4], LFSR[3], LFSR[2], LFSR[1]};
end

endmodule
