`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 16:11:13
// Design Name: 
// Module Name: RingCounterX3
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


module RingCounterX3(
//ReadReg�� ����ϴ� ReadAddressCounter ��⿡ ���
    clk, rst_n, en, 
    count
);

parameter initCount = 0; //3���� ReadReg ���� ���ڸ� �����ϱ� ���� �Ķ����
parameter DATANUM = 15;

input clk, rst_n; //1bit input
input en; //1bit input
output reg [DATANUM-1:0] count; //15bit output

//clk�� ��¿����ų� rst_n�� �ϰ������� �� ����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin //rst_n�� 0�� �� �ʱ�ȭ
        //initCount �Ķ���Ͱ� 0�� ��(ReadReg�� ���� ���ڰ� 0�� ��) count �ʱ�ȭ
        if(initCount == 0) count <= 15'b100_0000_0000_0000; 
        //initCount�� 0�� �ƴ� �� 1�� initCount - 1��ŭ left shift�ؼ� count �ʱ�ȭ
        else count <= 1 << (initCount - 1);
    end
    else begin //rst_n�� 1 ��
        //en�� 1�� ��, count�� 3bit�� left shift
        if(en) count <= {count[11:0], count[14:12]};
        else count <= count; //en�� 0�� ��
    end
end

endmodule
