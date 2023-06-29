`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/11 21:50:45
// Design Name: 
// Module Name: tb_Moore_101Detector
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


module tb_Moore_101Detector();

reg clk, rst_n, X; //1bit input
wire Y; //1bit output

initial begin //초기값 선언
    clk=0; rst_n = 1; X=0; //0ns~
    #10 rst_n=0; //10ns~
    #10 rst_n=1; //20ns~
    #10 X=1; //30ns~
    #10 X=0;//40ns~
    #20 X=1; //60ns~
    #10 X=0; //70ns~
    #10 X=1; //80ns~
    #10 X=0; //90ns~
    #20 X=1; //110ns~
    #10 X=0; //120ns~
    #20 X=1; //140ns~
    #20 X=0; //160ns~
    #10 X=1; //170ns~
    #10 X=0; //180ns~
    #10 $finish; //190ns~
end

always #5 clk = ~clk; //5ns마다 clk 값 반전

//모듈에 값 전달
Moore_101Detector MD (clk, rst_n, X, Y);

endmodule
