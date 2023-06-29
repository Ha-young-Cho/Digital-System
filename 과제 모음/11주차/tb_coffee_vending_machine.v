`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/19 10:30:24
// Design Name: 
// Module Name: tb_coffee_vending_machine
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


module tb_coffee_vending_machine(); //테스트벤치 선언

reg clk, rst_n;
reg coin; //동전 입력에 대한 신호
reg buy; //커피 구매에 대한 신호
wire coffee; //커피 나옴
wire return; //동전 반환

initial begin //초기값 선언
    clk=1'b1; rst_n=1'b0; coin=1'b0; buy=1'b0;
    #10 rst_n = 1'b1; coin = 1'b1;
    #30 buy = 1'b1; coin = 1'b0;
    #10 coin = 1'b1; buy=1'b0;
    #10 buy = 1'b1; coin = 1'b0;
    #10 coin = 1'b1; buy = 1'b0;
    #50 coin = 1'b0;
    #5 $finish;
end

always #5 clk <= ~clk; //5ns마다 clk 값 반전

//모듈에 값 전달
coffee_vending_machine CVM (clk, rst_n, coin, buy, coffee, return);

endmodule
