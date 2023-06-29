`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/14 23:55:50
// Design Name: 
// Module Name: tb_truth_table
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


module tb_truth_table; //테스테벤치 모듈 선언
reg A, B, C; //input으로 사용할 A,B,C
wire Y; //output으로 사용할 Y
    
initial begin //시작
    A=0; B=0; C=0; //0ns일 때 A=0 B=0 C=0
    #5 C=1; //5ns일 때 A=0 B=0 C=1
    #5 B=1;C=0; //10ns일 때 A=0 B=1 C=0
    #5 C=1; //15ns일 때 A=0 B=1 C=1
    #5 A=1;B=0;C=0; //20ns일 때 A=1 B=0 C=0
    #5 C=1; //25ns일 때 A=1 B=0 C=1
    #5 B=1;C=0; //30ns일 때 A=1 B=1 C=0
    #5 C=1; //35ns일 때 A=1 B=1 C=1
end

truth_table DUT(.A(A), .B(B), .C(C), .Y(Y)); //truth_table 모듈에 값을 전달하여 테스트
    
endmodule
