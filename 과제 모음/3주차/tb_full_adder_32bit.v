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


module tb_full_adder_32bit; //�׽�Ʈ��ġ ����

reg [31:0] x, y; //input���� ����� 32bit
reg c_in; //input���� ����� 1bit
wire [31:0] sum; //output���� ����� 32bit
wire c_out; //output���� ����� 1bit

initial begin //�ʱⰪ ����
    x = 32'b0; 
    y = 32'b0;
    c_in = 1'b0;
end

//10ns���� x�� 1(10) ���ϱ�
always #10 x = x + 32'b00000000000000000000000000000001;
//20ns���� y�� 2(10) ���ϱ�
always #20 y = y + 32'b00000000000000000000000000000010;
//30ns���� c_in�� 1(10) ���ϱ�
always #30 c_in = c_in +1'b1;

//full_adder_32bit ��⿡ �� �����Ͽ� �ùķ��̼�
full_adder_32bit fa32(x,y,c_in,sum,c_out);

endmodule
