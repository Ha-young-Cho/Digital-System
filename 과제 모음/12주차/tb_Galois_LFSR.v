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


module tb_Galois_LFSR(); //테스트벤치 선언

parameter BITWIDTH = 5; //파라미터로 bit 수 설정
reg clk;
reg arst_n;
wire [BITWIDTH-1:0] LFSR;

initial begin //초기값 설정
    clk = 1'b1; arst_n=1'b1;
    #1 arst_n=1'b0;
    #1 arst_n=1'b1;
end

//5ns마다 clk 값 반전
always #5 clk <= ~clk;
    
Galois_LFSR GLFSR(clk, arst_n, LFSR); //모듈에 값 전달

endmodule
