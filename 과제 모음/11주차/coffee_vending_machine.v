`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/18 18:26:15
// Design Name: 
// Module Name: coffee_vending_machine
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


module coffee_vending_machine(
    clk, rst_n, coin, buy,
    coffee, return
);

input clk, rst_n;
input coin; //동전 입력에 대한 신호
input buy; //커피 구매에 대한 신호
output coffee; //커피 나옴
output return; //동전 반환

localparam INITIAL = 3'b000, //초기화 상태
           COIN1 = 3'b001,//100원 입력
           COIN2 = 3'b010, //200원 입력
           COIN3 = 3'b011,//300원 입력
           COINOVER3 = 3'b100, //300원 초과 입력
           COFFEE = 3'b101; // COFFEE 나옴
           
reg [2:0] present_state, next_state;

always @(present_state or coin or buy) begin
    case(present_state)
        INITIAL:
            if(coin==1) next_state = COIN1; // 1/0, 1/1
            else next_state = INITIAL; // 0/0, 0/1
        COIN1:
            if(coin==1) next_state = COIN2; // 1/0. 1/1
            else begin
                if(buy==1) next_state = INITIAL; // 0/1
                else next_state = COIN1; // 0/0
            end
        COIN2:
            if(coin==1) next_state = COIN3; // 1/0, 1,1
            else begin
                if(buy==1) next_state = INITIAL; // 0/1
                else next_state = COIN2; // 0/0
            end
        COIN3:
            if(coin==1) next_state = COINOVER3; // 1/0, 1,1
            else begin
                if(buy==1) next_state = COFFEE; // 0/1
                else next_state = COIN3; // 0/0
            end
        COINOVER3:
            if (coin==0 && buy ==0) next_state = COINOVER3; // 0/0
            else next_state = INITIAL; // 0/1, 1/0, 1/1
        COFFEE:
            if(coin==1) next_state = COIN1; // 1/0, 1,1
            else next_state = INITIAL; // 0/0, 0/1
    endcase
end

//clk가 상승엣지거나 rst_n이 하강엣지일 때 동작
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) present_state <= INITIAL; //초기 state를 INITIAL로 설정
    else present_state <= next_state;
end

//최종 output 계산
assign coffee = (present_state == COFFEE);
assign return = (present_state == INITIAL); 

endmodule
