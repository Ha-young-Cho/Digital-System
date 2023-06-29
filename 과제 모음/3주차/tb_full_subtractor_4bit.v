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


module tb_full_subtractor_4bit; //�׽�Ʈ��ġ ����

reg [3:0] a, b; //4bit input
reg b_in; //1bit
wire [3:0] d; //4bit output
wire b_out; //1bit
wire V; //overflow detection

initial begin //�ʱⰪ ����
    a = 4'b1111;
    b = 4'b0000;
    b_in = 1'b0;
end

//5ns���� b�� 1(2)�� ������Ŵ
always #5 b = b + 4'b0001;

//full_subtractor_4bit ��⿡ ���� �����Ͽ� �ùķ��̼�
full_subtractor_4bit FS(a,b,b_in,d,b_out,V);

endmodule
