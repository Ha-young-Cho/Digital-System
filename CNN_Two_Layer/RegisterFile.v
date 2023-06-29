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
parameter ADDRESS = 4;
parameter DATAWIDTH = 8;
parameter DATANUM = 15;

input clk, rst_n; //1bit input
input WriteEn; //1bit input
input [ADDRESS-1:0] WriteReg; //Mbit input. data를 저장할 주소
input signed [DATAWIDTH-1:0] WriteData; //Wbit input. 저장할 data
input ReadEn; //1bit input
input [ADDRESS-1:0] ReadReg1, ReadReg2, ReadReg3; //Mbit input. read할 data 주소
output reg signed [DATAWIDTH-1:0] ReadData1, ReadData2, ReadData3; //Wbit output. read할 data

reg signed [DATAWIDTH-1:0] file [0:DATANUM-1]; //Wbit의 reg 타입이 Nbit 있는 벡터 (register file table)

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

//clk가 상승 엣지거나 rst_n이 하강 엣지일 때 동작 
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin //rst_n이 0일 때 0으로 초기화
        ReadData1 <= 0;
        ReadData2 <= 0;
        ReadData3 <= 0;
    end
    else begin //rst_n이 1일 때
        //WriteEn이 1일 때, 데이터 1개 write
        if (WriteEn) file[WriteReg] <= WriteData; 
        else if (ReadEn) begin //ReadEn이 1일 때, 데이터 3개 read
            ReadData1 <= file[ReadReg1];
            ReadData2 <= file[ReadReg2];
            ReadData3 <= file[ReadReg3];
        end
    end
end

endmodule
