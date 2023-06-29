`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 16:02:24
// Design Name: 
// Module Name: RingCounter
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


module RingCounter( 
//WriteReg�� ����ϴ� WriteAddressCounter�� ����ϴ� ���
    clk, rst_n, en, 
    count
);

parameter DATANUM = 15;

input clk, rst_n; //1bit input
input en; //1bit input
output reg [DATANUM-1:0] count; //15bit output


//clk�� ��� �����ų� rst_n�� �ϰ� ������ ����
always @(posedge clk or negedge rst_n) begin
    //rst_n�� 0�� ��, count �ʱ�ȭ
    if(!rst_n) count <= 15'b100_0000_0000_0000;
    else begin //rst_n�� 1�� ��
        //en�� 1�� ��, count�� 1bit�� left shift
        if(en) count <= {count[13:0], count[14]};
        else count <= count; //en�� 0�� ��
    end
end

endmodule
