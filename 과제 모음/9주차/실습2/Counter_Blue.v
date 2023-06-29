`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/03 17:38:12
// Design Name: 
// Module Name: Counter_Blue
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


module Counter_Blue(
    Start, clk,
    ReadRegEven, ReadRegOdd
);

input Start; //1bit input
input clk; //1bit input
output reg [2:0] ReadRegEven, ReadRegOdd; //홀수와 짝수 주소를 가리키는 신호

initial begin //초기값 설정
    ReadRegEven = 3'b000;
    ReadRegOdd = 3'b001;
end

//clk가 상승 엣지일 때 동작
always @(posedge clk) begin
    if(Start) begin //Start 신호가 들어올 때
        //ReadRegEven : 0,2,4,6 & ReadRegOdd : 1,3,5,7을 생성하는 구문
        if(ReadRegEven>3'd6 && ReadRegOdd>3'd7) begin
            ReadRegEven <= 3'b000;
            ReadRegOdd <= 3'b001;
        end
        else begin
            ReadRegEven <= ReadRegEven + 3'd2;
            ReadRegOdd <= ReadRegOdd + 3'd2;
        end
    end
end

endmodule
