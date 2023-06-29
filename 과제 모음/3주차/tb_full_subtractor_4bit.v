`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/24 01:10:39
// Design Name: 
// Module Name: tb_full_subtractor_4bit
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


module tb_full_subtractor_4bit; //테스트벤치 선언

reg [3:0] a, b; //4bit input
reg b_in; //1bit
wire [3:0] d; //4bit output
wire b_out; //1bit
wire V; //overflow detection

initial begin //초기값 선언
    a = 4'b1111;
    b = 4'b0000;
    b_in = 1'b0;
end

//5ns마다 b를 1(2)씩 증가시킴
always #5 b = b + 4'b0001;

//full_subtractor_4bit 모듈에 값을 전달하여 시뮬레이션
full_subtractor_4bit FS(a,b,b_in,d,b_out,V);

endmodule
