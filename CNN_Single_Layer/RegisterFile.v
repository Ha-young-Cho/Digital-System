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

module RegisterFile( //곱셈 결과를 저장한 뒤, 3개의 값을 출력하는 모듈
    clk, rst_n, WriteEn, WriteReg, WriteData, ReadEn, ReadReg1, ReadReg2, ReadReg3,
    ReadData1, ReadData2, ReadData3
);

//파라미터 선언
parameter M = 4;
parameter N = 15;
parameter W = 8;

input clk, rst_n; //1bit input
input WriteEn; //1bit input
input [M-1:0] WriteReg; //Mbit input. data를 저장할 주소
input [W-1:0] WriteData; //Wbit input. 저장할 data
input ReadEn; //1bit input
input [M-1:0] ReadReg1, ReadReg2, ReadReg3; //Mbit input. read할 data 주소
output reg [W-1:0] ReadData1, ReadData2, ReadData3; //Wbit output. read할 data

reg [W-1:0] file [0:N-1]; //Wbit의 reg 타입이 Nbit 있는 벡터 (register file table)

//clk가 상승 엣지거나 rst_n이 하강 엣지일 때 동작 
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin //rst_n이 0일 때 0으로 초기화
        ReadData1 <= {W{1'b0}};
        ReadData2 <= {W{1'b0}};
        ReadData3 <= {W{1'b0}};
    end
    else begin //rst_n이 1일 때
        //WriteEn이 1일 때, 데이터 1개 write
        if (WriteEn) file[WriteReg] <= WriteData; 
        
        //ReadEn이 1일 때, 데이터 3개 read
        if (ReadEn) begin
            ReadData1 <= file[ReadReg1]; 
            ReadData2 <= file[ReadReg2]; 
            ReadData3 <= file[ReadReg3]; 
        end
    end
end

endmodule
