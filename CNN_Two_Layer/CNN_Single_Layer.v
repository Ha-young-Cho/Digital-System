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


module CNN_Single_Layer( //Top 모듈
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
    
    // 곱셈 계산, 출력 bit수 유의
    // MultValue = Image * Filter
    Multiplicator #(.INPUT(INPUT), .FILTER(FILTER)) Multiplicator (.Start(Start), .din0(Image), .din1(Filter), .dout(MultValue));   // 곱셈 결과 = Partial Sum (PSum)
   
   // Register File Read/Write 주소 계산 
   /*
    1. WriteReg : 0, 1, 2, ..., 14를 출력
    2. ReadReg1 : 0, 3, 6, 9, 12, 0, 3, ...을 출력
    3. ReadReg2 : 1, 4, 7, 10, 13, 1, 4, ...을 출력
    4. ReadReg3 : 2, 5, 8, 11, 14, 2, 5, ...을 출력
   */
     AddressCounter #(.ADDRESS(ADDRESS), .DATANUM(DATANUM), .DATAWIDTH(DATAWIDTH)) AddressCounter (.clk(clk), .rst_n(rst_n), .Start(Start), .WriteReg(WriteReg), .ReadEn(ReadEn),
        .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3));
    
    // 컨볼루션 연산 중 계산된 Partial Sum들을 저장하기 위한 Register File
    /*
    1.  Register File 쓰기 (Write) 동작     
        1) WriteReg : Partial Sum을 Register File에 저장할 때 주소값 
        2) MultValue : Partial Sum을 Register File에 저장할 때 저장할 값
        3) Start : Start = 1일 때만 Register File에 데이터 저장
    
    2.  Register File 읽기 (Read) 동작
        1) ReadReg1, ReadReg2, ReadReg3 : Register File에서 데이터를 읽어올 때 주소값 (동시에 3개 데이터를 읽어옴)
        2) ReadData1, ReadData2, ReadData3 : Register File에서 데이터를 읽어올 때 데이터의 값 (동시에 3개 데이터를 읽어옴)
        3) ReadEn : ReadEn = 1일 때만 데이터를 읽어옴

    3.  Register File의 스펙
        1) Number of address bits = 4
        2) Number of words = 15
        3) Number of bits in a word = 8
    */
    RegisterFile #(.ADDRESS(ADDRESS), .DATANUM(DATANUM), .DATAWIDTH(DATAWIDTH))
        RegisterFile (.clk(clk), .rst_n(rst_n), .WriteEn(Start), .WriteReg(WriteReg), .WriteData(MultValue),
        .ReadEn(ReadEn), .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3),
        .ReadData1(ReadData1), .ReadData2(ReadData2), .ReadData3(ReadData3));
    
    // 덧셈 계산, 출력 bit수 유의
    // ConvResult = ReadData1 + ReadData2 + ReadData3
    ADDER #(.DATAWIDTH(DATAWIDTH), .RESULT(RESULT)) ADDER(.clk(clk), .rst_n(rst_n), .data1(ReadData1), .data2(ReadData2), .data3(ReadData3), .out(Conv_to_ReLU));
    
    //ConvResult를 ReLU로 통과시킴
    ReLU #(.RESULT(RESULT)) ReLU(.d_in(Conv_to_ReLU), .d_out(ConvResult));
    
endmodule
