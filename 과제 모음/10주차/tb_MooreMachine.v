`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/11 20:21:40
// Design Name: 
// Module Name: tb_MooreMachine
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


module tb_MooreMachine(); //�׽�Ʈ��ġ ����

reg clk, rst_n, X; //1bit input
wire Y; //1bit output

initial begin //�ʱⰪ ����
    clk=0; rst_n = 1; X=0; //0ns~
    #10 rst_n=0; //10ns~
    #10 rst_n=1; //20ns~
    #10 X=1; //30ns~
    #10 X=0;//40ns~
    #20 X=1; //60ns~
    #10 X=0; //70ns~
    #20 X=1; //90ns~
    #10 X=0; //100ns~
    #10 $finish; //110ns~
end

always #5 clk = ~clk; //5ns���� clk �� ����

//��⿡ �� ����
MooreMachine MM(clk, rst_n, X, Y);

endmodule
