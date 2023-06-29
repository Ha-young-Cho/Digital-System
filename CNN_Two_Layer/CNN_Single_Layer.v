`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 15:16:55
// Design Name: 
// Module Name: CNN_Single_Layer
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


module CNN_Single_Layer( //Top ���
    clk, rst_n, Start, Image, Filter, ReadEn, ConvResult
);

    parameter INPUT = 4; //IMAGE BITWIDTH
    parameter FILTER = 4; //FILTER BITWIDTH
    parameter RESULT = 10; //CONVRESULT BITWIDTH
    
    parameter ADDRESS = 4; //REGISTER FILE ADDRESS BITWITDTH
    parameter DATAWIDTH = 8; //REGISTER FILE DATA BITWIDTH
    parameter DATANUM = 15; //REGISTER FILE DATA NUM
    
    input clk;
    input rst_n;
    input Start;
    input [INPUT-1:0] Image;
    input signed [FILTER-1:0] Filter;
    input ReadEn;
    output signed [RESULT-1:0] ConvResult;

    wire signed [DATAWIDTH-1:0] MultValue;
    
    wire [14:0] WriteRegCnt;
    wire [ADDRESS-1:0] WriteReg;
    
    wire [14:0] ReadRegCnt1, ReadRegCnt2, ReadRegCnt3;
    wire [ADDRESS-1:0] ReadReg1, ReadReg2, ReadReg3;
    wire signed [DATAWIDTH-1:0] ReadData1, ReadData2, ReadData3;
    
    wire signed [RESULT-1:0] Conv_to_ReLU;
    
    // ���� ���, ��� bit�� ����
    // MultValue = Image * Filter
    Multiplicator #(.INPUT(INPUT), .FILTER(FILTER)) Multiplicator (.Start(Start), .din0(Image), .din1(Filter), .dout(MultValue));   // ���� ��� = Partial Sum (PSum)
   
   // Register File Read/Write �ּ� ��� 
   /*
    1. WriteReg : 0, 1, 2, ..., 14�� ���
    2. ReadReg1 : 0, 3, 6, 9, 12, 0, 3, ...�� ���
    3. ReadReg2 : 1, 4, 7, 10, 13, 1, 4, ...�� ���
    4. ReadReg3 : 2, 5, 8, 11, 14, 2, 5, ...�� ���
   */
     AddressCounter #(.ADDRESS(ADDRESS), .DATANUM(DATANUM), .DATAWIDTH(DATAWIDTH)) AddressCounter (.clk(clk), .rst_n(rst_n), .Start(Start), .WriteReg(WriteReg), .ReadEn(ReadEn),
        .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3));
    
    // ������� ���� �� ���� Partial Sum���� �����ϱ� ���� Register File
    /*
    1.  Register File ���� (Write) ����     
        1) WriteReg : Partial Sum�� Register File�� ������ �� �ּҰ� 
        2) MultValue : Partial Sum�� Register File�� ������ �� ������ ��
        3) Start : Start = 1�� ���� Register File�� ������ ����
    
    2.  Register File �б� (Read) ����
        1) ReadReg1, ReadReg2, ReadReg3 : Register File���� �����͸� �о�� �� �ּҰ� (���ÿ� 3�� �����͸� �о��)
        2) ReadData1, ReadData2, ReadData3 : Register File���� �����͸� �о�� �� �������� �� (���ÿ� 3�� �����͸� �о��)
        3) ReadEn : ReadEn = 1�� ���� �����͸� �о��

    3.  Register File�� ����
        1) Number of address bits = 4
        2) Number of words = 15
        3) Number of bits in a word = 8
    */
    RegisterFile #(.ADDRESS(ADDRESS), .DATANUM(DATANUM), .DATAWIDTH(DATAWIDTH))
        RegisterFile (.clk(clk), .rst_n(rst_n), .WriteEn(Start), .WriteReg(WriteReg), .WriteData(MultValue),
        .ReadEn(ReadEn), .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3),
        .ReadData1(ReadData1), .ReadData2(ReadData2), .ReadData3(ReadData3));
    
    // ���� ���, ��� bit�� ����
    // ConvResult = ReadData1 + ReadData2 + ReadData3
    ADDER #(.DATAWIDTH(DATAWIDTH), .RESULT(RESULT)) ADDER(.clk(clk), .rst_n(rst_n), .data1(ReadData1), .data2(ReadData2), .data3(ReadData3), .out(Conv_to_ReLU));
    
    //ConvResult�� ReLU�� �����Ŵ
    ReLU #(.RESULT(RESULT)) ReLU(.d_in(Conv_to_ReLU), .d_out(ConvResult));
    
endmodule
