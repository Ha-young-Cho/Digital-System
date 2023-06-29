`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 16:02:24
// Design Name: 
// Module Name: RingCounter
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


module RingCounter( 
//WriteReg를 계산하는 WriteAddressCounter에 사용하는 모듈
    clk, rst_n, en, 
    count
);

parameter DATANUM = 15;

input clk, rst_n; //1bit input
input en; //1bit input
output reg [DATANUM-1:0] count; //15bit output


//clk가 상승 엣지거나 rst_n이 하강 엣지면 동작
always @(posedge clk or negedge rst_n) begin
    //rst_n이 0일 때, count 초기화
    if(!rst_n) count <= 15'b100_0000_0000_0000;
    else begin //rst_n이 1일 때
        //en이 1일 때, count를 1bit씩 left shift
        if(en) count <= {count[13:0], count[14]};
        else count <= count; //en이 0일 때
    end
end

endmodule
