`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 01:40:12
// Design Name: 
// Module Name: program_counter_nbit
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


module program_counter_nbit( //모듈 선언
    clk, rst_n, PCdata, PCload, PCinc, PCout
);

input clk, rst_n; //1bit input
input [N-1:0] PCdata; //Nbit input
input PCload, PCinc; //1bit input
output reg [N-1:0] PCout; //Nbit output

parameter N = 32; //N값을 설정하는 파라미터

//clk가 상승 엣지이거나 rst_n이 하강엣지일 때 동작
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) PCout <= 0; //rst_n이 0이면 PCout을 0으로 설정
    else begin //rst_n이 1
        if(PCload == 1) PCout <= PCdata; //PCload가 1이면 PCout에 PCdata 입력
        else begin //PCload가 0
            if(PCinc == 1) PCout <= PCout + 1; //PCinc가 1이면 PCout이 1씩 증가
            else PCout <= PCout; //PCinc이 0이면 PCout 값 유지
        end
    end
end

endmodule
