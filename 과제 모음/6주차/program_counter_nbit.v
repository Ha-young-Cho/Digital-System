`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 01:40:12
// Design Name: 
// Module Name: program_counter_nbit
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


module program_counter_nbit( //��� ����
    clk, rst_n, PCdata, PCload, PCinc, PCout
);

input clk, rst_n; //1bit input
input [N-1:0] PCdata; //Nbit input
input PCload, PCinc; //1bit input
output reg [N-1:0] PCout; //Nbit output

parameter N = 32; //N���� �����ϴ� �Ķ����

//clk�� ��� �����̰ų� rst_n�� �ϰ������� �� ����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) PCout <= 0; //rst_n�� 0�̸� PCout�� 0���� ����
    else begin //rst_n�� 1
        if(PCload == 1) PCout <= PCdata; //PCload�� 1�̸� PCout�� PCdata �Է�
        else begin //PCload�� 0
            if(PCinc == 1) PCout <= PCout + 1; //PCinc�� 1�̸� PCout�� 1�� ����
            else PCout <= PCout; //PCinc�� 0�̸� PCout �� ����
        end
    end
end

endmodule
