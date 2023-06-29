`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 01:55:51
// Design Name: 
// Module Name: tb_program_counter_nbit
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


module tb_program_counter_nbit; //테스트벤치 선언

reg clk, rst_n; //1bit input
reg [N-1:0] PCdata; //Nbit input
reg PCload, PCinc; //1bit input
wire [N-1:0] PCout; //Nbit output

parameter N = 32; //N값을 설정하는 파라미터

initial begin //초기값 선언
    rst_n <= 1'b0; //rst_n을 통해 초기값을 0으로 설정
    clk <= 1'b1;
    PCload <= 1'b1;
    PCinc <= 1'b1;
    PCdata <= 0;
    #5 rst_n <= 1'b1; PCload <= 1'b0;//5ns 후 rst_n, PCload 값 변경
end

always #5 clk <= ~clk; //5ns마다 clk 값 반전
always #50 rst_n <= ~rst_n; //50ns마다 rst_n 값 반전
always #30 PCload <= ~PCload; //30ns마다 PCload 값 반전
always #15 PCinc <= ~PCinc; //15ns마다 PCinc 값 반전
always #20 PCdata <= PCdata + 1;

//시뮬레이션을 위해 program_counter_nbit로 값 전달
program_counter_nbit PC(clk, rst_n, PCdata, PCload, PCinc, PCout);

endmodule
