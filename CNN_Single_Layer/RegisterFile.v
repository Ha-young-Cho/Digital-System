`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 15:20:09
// Design Name: 
// Module Name: RegisterFile
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

module RegisterFile( //���� ����� ������ ��, 3���� ���� ����ϴ� ���
    clk, rst_n, WriteEn, WriteReg, WriteData, ReadEn, ReadReg1, ReadReg2, ReadReg3,
    ReadData1, ReadData2, ReadData3
);

//�Ķ���� ����
parameter M = 4;
parameter N = 15;
parameter W = 8;

input clk, rst_n; //1bit input
input WriteEn; //1bit input
input [M-1:0] WriteReg; //Mbit input. data�� ������ �ּ�
input [W-1:0] WriteData; //Wbit input. ������ data
input ReadEn; //1bit input
input [M-1:0] ReadReg1, ReadReg2, ReadReg3; //Mbit input. read�� data �ּ�
output reg [W-1:0] ReadData1, ReadData2, ReadData3; //Wbit output. read�� data

reg [W-1:0] file [0:N-1]; //Wbit�� reg Ÿ���� Nbit �ִ� ���� (register file table)

//clk�� ��� �����ų� rst_n�� �ϰ� ������ �� ���� 
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin //rst_n�� 0�� �� 0���� �ʱ�ȭ
        ReadData1 <= {W{1'b0}};
        ReadData2 <= {W{1'b0}};
        ReadData3 <= {W{1'b0}};
    end
    else begin //rst_n�� 1�� ��
        //WriteEn�� 1�� ��, ������ 1�� write
        if (WriteEn) file[WriteReg] <= WriteData; 
        
        //ReadEn�� 1�� ��, ������ 3�� read
        if (ReadEn) begin
            ReadData1 <= file[ReadReg1]; 
            ReadData2 <= file[ReadReg2]; 
            ReadData3 <= file[ReadReg3]; 
        end
    end
end

endmodule
