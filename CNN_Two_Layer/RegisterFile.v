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
parameter ADDRESS = 4;
parameter DATAWIDTH = 8;
parameter DATANUM = 15;

input clk, rst_n; //1bit input
input WriteEn; //1bit input
input [ADDRESS-1:0] WriteReg; //Mbit input. data�� ������ �ּ�
input signed [DATAWIDTH-1:0] WriteData; //Wbit input. ������ data
input ReadEn; //1bit input
input [ADDRESS-1:0] ReadReg1, ReadReg2, ReadReg3; //Mbit input. read�� data �ּ�
output reg signed [DATAWIDTH-1:0] ReadData1, ReadData2, ReadData3; //Wbit output. read�� data

reg signed [DATAWIDTH-1:0] file [0:DATANUM-1]; //Wbit�� reg Ÿ���� Nbit �ִ� ���� (register file table)

initial begin
    file[0] <= {DATAWIDTH{1'b0}};
    file[1] <= {DATAWIDTH{1'b0}};
    file[2] <= {DATAWIDTH{1'b0}};
    file[3] <= {DATAWIDTH{1'b0}};
    file[4] <= {DATAWIDTH{1'b0}};
    file[5] <= {DATAWIDTH{1'b0}};
    file[6] <= {DATAWIDTH{1'b0}};
    file[7] <= {DATAWIDTH{1'b0}};
    file[8] <= {DATAWIDTH{1'b0}};
    file[9] <= {DATAWIDTH{1'b0}};
    file[10] <= {DATAWIDTH{1'b0}};
    file[11] <= {DATAWIDTH{1'b0}};
    file[12] <= {DATAWIDTH{1'b0}};
    file[13] <= {DATAWIDTH{1'b0}};
    file[14] <= {DATAWIDTH{1'b0}};
end

//clk�� ��� �����ų� rst_n�� �ϰ� ������ �� ���� 
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin //rst_n�� 0�� �� 0���� �ʱ�ȭ
        ReadData1 <= 0;
        ReadData2 <= 0;
        ReadData3 <= 0;
    end
    else begin //rst_n�� 1�� ��
        //WriteEn�� 1�� ��, ������ 1�� write
        if (WriteEn) file[WriteReg] <= WriteData; 
        else if (ReadEn) begin //ReadEn�� 1�� ��, ������ 3�� read
            ReadData1 <= file[ReadReg1];
            ReadData2 <= file[ReadReg2];
            ReadData3 <= file[ReadReg3];
        end
    end
end

endmodule
