`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/25 21:52:59
// Design Name: 
// Module Name: tb_Muxed_Galois_LFSR
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


module tb_Muxed_Galois_LFSR(); //테스트벤치 선언

reg clk, arst_n;
reg [2:0] r;
reg L;
wire [2:0] LFSR;

initial begin //초기값 선언
    clk=1'b1; arst_n=1'b1; r=3'b000; L=1'b1;
    #1 arst_n=1'b0;
    #1 arst_n=1'b1;
    #10 r=3'b001;
    #10 L=1'b0; r=3'b010;
    #10 r=3'b011;
    #10 L=1'b1; r=3'b100;
    #10 r=3'b101;
    #20 $finish;
end

//5ns마다 clk 값 반전
always #5 clk <= ~clk;

//모듈에 값 전달
Muxed_Galois_LFSR M_G_LFSR(clk, arst_n, r, L, LFSR);

endmodule
