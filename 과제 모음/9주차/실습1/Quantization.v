`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 20:36:34
// Design Name: 
// Module Name: Quantization
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


module Quantization(
    sum, c_out,
    out1
);
    
input [3:0] sum; //4bit ���� ���
input c_out; //���� �ڸ� �ø�
output reg [3:0] out1; //4bit output

initial begin //�ʱ�ȭ
    out1 = 4'b0000;
end

always @(*) begin
    //c_out ���� ���� out1 �� ��ȭ
    if(c_out == 0) out1 <= sum;
    else out1 <= {c_out, sum[3:1]}; //concat + slice
end
    
endmodule
