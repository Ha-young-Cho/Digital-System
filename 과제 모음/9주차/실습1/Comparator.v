`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 20:36:18
// Design Name: 
// Module Name: Comparator
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


module Comparator(
    ReadDataA2, ReadDataB, start,
    out2
);
    
input [3:0] ReadDataA2; //4bit의 read할 데이터
input [3:0] ReadDataB; //4bit의 read할 데이터
input start; //1bit input
output reg [3:0] out2; //비교 후 더 큰 값을 저장하는 output

initial begin //초기화
    out2 = 4'b0000;
end

always @(*) begin
    if(start == 1) begin //start 신호가 들어올 때
        // 두 데이터의 대소 비교 후, 더 큰 값을 out2에 저장
        if(ReadDataA2 >= ReadDataB) out2 <= ReadDataA2;
        else out2 <= ReadDataB;
    end //start 신호가 들어오지 않을 때
    else out2 <= out2;
end
    
endmodule
