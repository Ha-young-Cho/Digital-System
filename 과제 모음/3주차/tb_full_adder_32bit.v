`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/23 23:11:09
// Design Name: 
// Module Name: tb_full_adder_32bit
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


module tb_full_adder_32bit; //테스트벤치 선언

reg [31:0] x, y; //input으로 사용할 32bit
reg c_in; //input으로 사용할 1bit
wire [31:0] sum; //output으로 사용할 32bit
wire c_out; //output으로 사용할 1bit

initial begin //초기값 설정
    x = 32'b0; 
    y = 32'b0;
    c_in = 1'b0;
end

//10ns마다 x에 1(10) 더하기
always #10 x = x + 32'b00000000000000000000000000000001;
//20ns마다 y에 2(10) 더하기
always #20 y = y + 32'b00000000000000000000000000000010;
//30ns마다 c_in에 1(10) 더하기
always #30 c_in = c_in +1'b1;

//full_adder_32bit 모듈에 값 전달하여 시뮬레이션
full_adder_32bit fa32(x,y,c_in,sum,c_out);

endmodule
