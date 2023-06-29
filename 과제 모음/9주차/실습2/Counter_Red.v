`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/03 17:37:55
// Design Name: 
// Module Name: Counter_Red
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


module Counter_Red(
    clk, WriteEn,
    Start
);

input clk; //1bit input
input WriteEn; //1bit input
output reg Start; //1bit output

reg [3:0] count; //8���� count�ϱ� ���� reg

initial begin //�ʱⰪ ����
    count = 4'd0; 
    Start = 1'b0;
end

//clk�� ��� ������ ����
always @(posedge clk) begin
    if(WriteEn) begin //WriteEn�� 1�̸�
        count <= count + 4'd1; //count ����
    end
    if(count==4'd8) Start <= 1'b1; //count�� 8�� �Ǹ�, Start�� high��
end

endmodule
