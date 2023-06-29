`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 03:59:33
// Design Name: 
// Module Name: tb_PRPG
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


module tb_PRPG; //테스트벤치 선언

reg clk, rst_n; // 1bit input
reg [0:n-1] seed; //가장 처음 초기값
wire [0:n-1] qout; //shift register로 생성되는 값
wire sequence; //생성된 bit sequence
wire [0:n-1] count; //bit sequence에서 1의 개수 count
wire [0:n-1] num; //다음 clk cycle에서 나타내기 위한 1의 개수
wire valid; //valid 신호

parameter n = 4; //bit 수에 맞게 코드가 동작하도록 파라미터 설정

initial begin //초기값 선언
    seed = {n{1'b1}}; //모든 bit가 1로 채워진 seed
    clk = 1'b1;
    rst_n = 1'b0; //rst_n을 통해 값 초기화
    #5 rst_n = 1'b1;
end

always #5 clk <= ~clk; // 5ns마다 clk 값 반전
always #200 rst_n <= ~rst_n; //50ns마다 rst_n 값 반전

//PRPG 모듈에 값을 전달하여 시뮬레이션
PRPG prpg(clk, rst_n, seed, qout, sequence, count, num, valid);

endmodule
