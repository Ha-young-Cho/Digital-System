`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/25 21:25:16
// Design Name: 
// Module Name: tb_Galois_LFSR
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


module tb_Galois_LFSR(); //�׽�Ʈ��ġ ����

parameter BITWIDTH = 5; //�Ķ���ͷ� bit �� ����
reg clk;
reg arst_n;
wire [BITWIDTH-1:0] LFSR;

initial begin //�ʱⰪ ����
    clk = 1'b1; arst_n=1'b1;
    #1 arst_n=1'b0;
    #1 arst_n=1'b1;
end

//5ns���� clk �� ����
always #5 clk <= ~clk;
    
Galois_LFSR GLFSR(clk, arst_n, LFSR); //��⿡ �� ����

endmodule
