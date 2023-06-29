`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 20:06:44
// Design Name: 
// Module Name: RegisterFileB
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


module RegisterFileB(
    WriteRegB, WriteDataB, WriteEnB, ReadRegB, clk, rst,
    ReadDataB
);

input [3:0] WriteRegB; //4bit�� ������ ���� �ּ�
input [7:0] WriteDataB; //8bit�� ������ ������
input WriteEnB; //1bit input
input [3:0] ReadRegB; //4bit�� read�� ������ �ּ�
input clk, rst; //1bit input
output [7:0] ReadDataB; //8bit�� read�� ������

reg [7:0] reg_file [0:15]; // 8bit�� reg Ÿ���� 16bit �ִ� ���� (register file table)

//ReadRegB ��ġ�� ������ read
assign ReadDataB = reg_file[ReadRegB];

//clk�� ��� �����ų� rst�� �ϰ� ������ �� ����
always @(posedge clk or negedge rst) begin
    if(!rst) begin //rst�� 0�� �� reg_file�� �Ʒ��� ���� �ʱ�ȭ
        reg_file[0] = 8'h00000000;
        reg_file[1] = 8'h00000001;
        reg_file[2] = 8'h00000002;
        reg_file[3] = 8'h00000003;
        reg_file[4] = 8'h00000004;
        reg_file[5] = 8'h00000005;
        reg_file[6] = 8'h00000006;
        reg_file[7] = 8'h00000007;
        reg_file[8] = 8'h00000008;
        reg_file[9] = 8'h00000009;
        reg_file[10] = 8'h0000000a;
        reg_file[11] = 8'h0000000b;
        reg_file[12] = 8'h0000000c;
        reg_file[13] = 8'h0000000d;
        reg_file[14] = 8'h0000000e;
        reg_file[15] = 8'h0000000f;
    end
    //WriteEnB�� 1�� ��, WriteDataB�� write
    else if(WriteEnB) reg_file[WriteRegB] <= WriteDataB;
end

endmodule
