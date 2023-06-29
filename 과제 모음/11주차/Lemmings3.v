`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/19 11:08:24
// Design Name: 
// Module Name: Lemmings3
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


module Lemmings3( //모듈 선언
    clk, rst_n, bump_left, bump_right, ground, dig,
    walk_left, walk_right, aaah, digging
);

input clk, rst_n;
input bump_left, bump_right; //장애물
input ground; //낭떠러지
input dig; //땅 파기 명령
output walk_left, walk_right; //걷기
output aaah; //소리 지르며 떨어지기
output digging; //땅 파기

//state를 3bit로 표현
localparam WALK_LEFT = 3'b000,
           WALK_RIGHT = 3'b001,
           FALL_LEFT = 3'b010,
           FALL_RIGHT = 3'b011,
           DIG_LEFT = 3'b100,
           DIG_RIGHT = 3'b101;

reg [2:0] present_state, next_state; //register 2개 선언

//clk가 상승 엣지거나 rst_n이 하강엣지일 때 동작
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) present_state <= WALK_LEFT; //초기화 state는 WALK_LEFT
    else present_state <= next_state; //그 외에는 next_state로 이동
end

always @(*) begin
    case(present_state) 
        WALK_LEFT:
            if(ground==1) begin //땅 위
                if(dig==1) next_state = DIG_LEFT; //땅 파기 명령
                else next_state = (bump_left) ? WALK_RIGHT : WALK_LEFT; //장애물 만나면 방향 전환
            end
            else next_state = FALL_LEFT; //낭떠러지
        WALK_RIGHT:
            if(ground==1) begin //땅 위
                if(dig==1) next_state = DIG_RIGHT; //땅 파기 명령
                else next_state = (bump_right) ? WALK_LEFT : WALK_RIGHT; //장애물 만나면 방향 전환
            end
            else next_state = FALL_RIGHT; //낭떠러지
        FALL_LEFT:
            if(ground==1) next_state = WALK_LEFT; //낭떠러지 끝나면 직전 진행 방향으로 걷기
            else next_state = FALL_LEFT; //계속 낭떠러지 상태
        FALL_RIGHT:
            if(ground==1) next_state = WALK_RIGHT; //낭떠러지 끝나면 직전 진행 방향으로 걷기
            else next_state = FALL_RIGHT; //계속 낭떠러지 상태
        DIG_LEFT:
            if(ground==1) next_state = DIG_LEFT; //땅 위에서 반대편으로 나올 때까지 계속 파기
            else next_state = FALL_LEFT; //낭떠러지 시작 혹은 떨어지는 도중에는 땅을 파는 명령 무시 
        DIG_RIGHT:
            if(ground==1) next_state = DIG_RIGHT; //땅 위에서 반대편으로 나올 때까지 계속 파기
            else next_state = FALL_RIGHT; //낭떠러지 시작 혹은 떨어지는 도중에는 땅을 파는 명령 무시 
    endcase
end

//각 상태에 따른 output 값 출력
assign walk_left = (present_state == WALK_LEFT);
assign walk_right = (present_state == WALK_RIGHT);
assign aaah = (present_state == FALL_LEFT)||(present_state == FALL_RIGHT);
assign digging = (present_state == DIG_LEFT)||(present_state == DIG_RIGHT);

endmodule
