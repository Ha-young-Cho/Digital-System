`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/11 20:13:43
// Design Name: 
// Module Name: MooreMachine
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


module MooreMachine( //모듈 선언
    clk, rst_n, X,
    Y
);

input clk, rst_n, X; //1bit input
output Y; //1bit output

//state를 local parameter로 정의
localparam S0 = 2'b00, 
           S1 = 2'b01,
           S2 = 2'b10;

//2bit로 state 표현
reg [1:0] present_state, next_state;

//combinational logic으로 다음 상태 계산
always @(present_state or X) begin //present_state나 X 신호가 동작하면
    case(present_state)
        S0: if(X) next_state = S1; else next_state = S0;
        S1: if(X) next_state = S2; else next_state = S0;
        S2: if(X) next_state = S2; else next_state = S0;
        default: next_state = S0;
    endcase
end

//sequential logic으로 현재 상태 업데이트
//clk가 상승 엣지거나 rst_n이 하강 엣지일 때 동작
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) present_state <= S0; //rst_n이 0일 때
    else present_state <= next_state; 
end

//출력 계산
assign Y = (present_state == S1);

endmodule
