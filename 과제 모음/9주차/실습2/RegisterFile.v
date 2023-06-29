`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/03 17:37:37
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


module RegisterFile(
    WriteEn, WriteReg, WriteData, ReadRegEven, ReadRegOdd, clk,
    ReadDataEven, ReadDataOdd
);

input clk; //1bit input
input WriteEn; //1bit input
input [2:0] WriteReg; //3bit�� ������ ���� �ּ�
input [15:0] WriteData; //16bit�� ������ ������
input [2:0] ReadRegEven, ReadRegOdd; //Ȧ���� ¦�� �ּҸ� ����Ű�� ��ȣ
output [15:0] ReadDataEven, ReadDataOdd; //�� ��ȣ�� ����Ű�� ������

reg [15:0] reg_file [0:7]; //bit width 16, word 8

//ReadRegEven, ReadRegOdd ��ġ�� ������ 2�� read
assign ReadDataEven = reg_file[ReadRegEven];
assign ReadDataOdd = reg_file[ReadRegOdd];

always @(posedge clk) begin //clk�� ��� ������ �� ����
    //WriteEn�� 1�̸� WriteData�� write
    if(WriteEn) reg_file[WriteReg] <= WriteData;
end

endmodule
