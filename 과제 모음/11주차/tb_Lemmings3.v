`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/19 11:26:02
// Design Name: 
// Module Name: tb_Lemmings3
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


module tb_Lemmings3(); //테스트벤치 선언

reg clk, rst_n;
reg bump_left, bump_right;//장애물
reg ground; //낭떠러지
reg dig; //땅 파기 명령
wire walk_left, walk_right; //걷기
wire aaah;//소리 지르며 떨어지기
wire digging; //땅 파기

initial begin //초기값 선언
    clk=1'b1; rst_n=1'b1; bump_left=1'b0; bump_right=1'b0; ground=1'b1; dig=1'b0;
    #1 rst_n=1'b0;
    #1 rst_n=1'b1;
    #40 dig = 1'b1;
    #20 dig = 1'b0;
    #20 bump_left = 1'b1;
    #20 bump_left = 1'b0;
    #20 ground = 1'b0;
    #60 ground =1'b1; dig =1'b1;
    #20 dig=1'b0;
    #80 $finish;
end

always #10 clk <= ~clk; //10ns마다 clk 값 반전

//모듈에 값 전달
Lemmings3 L3(clk, rst_n, bump_left, bump_right, ground, dig, walk_left, walk_right, aaah, digging);

endmodule
