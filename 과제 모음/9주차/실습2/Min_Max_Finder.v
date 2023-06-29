`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/03 17:30:36
// Design Name: 
// Module Name: Min_Max_Finder
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


module Min_Max_Finder(
    Start, clk, ReadDataEven, ReadDataOdd,
    Max, Min, Valid
);

input Start; //1bit input
input clk; //1bit input
input [15:0] ReadDataEven, ReadDataOdd; //저장되어 있는 data
output reg [15:0] Max, Min; //read한 값의 최댓값, 최솟값
output reg Valid; //모든 숫자에 대해 비교가 끝남을 의미

reg [2:0] count; //Valid를 출력하기 위한 count

initial begin //초기값 설정
    Min = 16'b1111_1111_1111_1111;
    Max = 16'b0000_0000_0000_0000;
    count = 3'b0;
    Valid = 1'b0;
end

//clk가 상승 엣지일 때 동작
always @(posedge clk) begin
    if(Start) begin //Start 신호가 들어올 때 최댓값, 최솟값 계산
        if(ReadDataEven < ReadDataOdd) begin
            if(Min > ReadDataEven) Min <= ReadDataEven;
            if(Max < ReadDataOdd) Max <= ReadDataOdd;
        end
        else begin
            if(Min > ReadDataOdd) Min <= ReadDataOdd;
            if(Max < ReadDataEven) Max <= ReadDataEven;
        end
        count <= count + 3'b1;
    end
    
    //모든 숫자에 대해 비교가 끝난 경우 Valid: 1 
    if(count == 3'd3) Valid = 1'b1;
end

endmodule
