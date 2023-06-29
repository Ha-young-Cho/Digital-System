`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/06 19:33:48
// Design Name: 
// Module Name: tb_updown_counter_4bit
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


module tb_updown_counter_4bit; //테스트벤치 선언

reg [3:0] data; //4bit input
reg load, enable, select; //1bit input
reg clk, rst_n; //1bit input
wire [3:0] out; //4bit output

initial begin //초기값 선언
    data = 4'b0100;
    clk = 1'b1;
    rst_n = 1'b1;
    load = 1'b1;
    select = 1'b0;
    enable = 1'b0;
    #10 load = 1'b0; //10ns 뒤 load 값 변화
end

always #5 clk <= ~clk; //5ns마다 clk 값을 반전시킴
always #120 rst_n <= ~rst_n; //120ns마다 rst_n 값을 반전시킴
always #100 load <= ~load; //100ns마다 load 값을 반전시킴
always #30 enable <= ~enable; //30ns마다 enable 값을 반전시킴
always #60 select <= ~select; //60ns마다 select 값을 반전시킴

//updown_counter_4bit 모듈에 값을 전달하여 시뮬레이션
updown_counter_4bit UC(clk, rst_n, data, load, enable, select, out);

endmodule
