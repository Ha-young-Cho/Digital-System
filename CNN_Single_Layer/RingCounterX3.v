`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 16:11:13
// Design Name: 
// Module Name: RingCounterX3
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


module RingCounterX3(
//ReadReg를 계산하는 ReadAddressCounter 모듈에 사용
    clk, rst_n, en, 
    count
);

input clk, rst_n; //1bit input
input en; //1bit input
output reg [14:0] count; //15bit output
parameter initCount = 0; //3개의 ReadReg 시작 숫자를 제어하기 위한 파라미터

//clk가 상승엣지거나 rst_n이 하강엣지일 때 동작
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin //rst_n이 0일 때 초기화
        //initCount 파라미터가 0일 때(ReadReg의 시작 숫자가 0일 때) count 초기화
        if(initCount == 0) count <= 15'b100_0000_0000_0000; 
        //initCount가 0이 아닐 때 1을 initCount - 1만큼 left shift해서 count 초기화
        else count <= 1 << (initCount - 1);
    end
    else begin //rst_n이 1 때
        //en이 1일 때, count를 3bit씩 left shift
        if(en) count <= {count[11:0], count[14:12]};
        else count <= count; //en이 0일 때
    end
end

endmodule
