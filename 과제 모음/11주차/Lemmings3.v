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


module Lemmings3( //��� ����
    clk, rst_n, bump_left, bump_right, ground, dig,
    walk_left, walk_right, aaah, digging
);

input clk, rst_n;
input bump_left, bump_right; //��ֹ�
input ground; //��������
input dig; //�� �ı� ���
output walk_left, walk_right; //�ȱ�
output aaah; //�Ҹ� ������ ��������
output digging; //�� �ı�

//state�� 3bit�� ǥ��
localparam WALK_LEFT = 3'b000,
           WALK_RIGHT = 3'b001,
           FALL_LEFT = 3'b010,
           FALL_RIGHT = 3'b011,
           DIG_LEFT = 3'b100,
           DIG_RIGHT = 3'b101;

reg [2:0] present_state, next_state; //register 2�� ����

//clk�� ��� �����ų� rst_n�� �ϰ������� �� ����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) present_state <= WALK_LEFT; //�ʱ�ȭ state�� WALK_LEFT
    else present_state <= next_state; //�� �ܿ��� next_state�� �̵�
end

always @(*) begin
    case(present_state) 
        WALK_LEFT:
            if(ground==1) begin //�� ��
                if(dig==1) next_state = DIG_LEFT; //�� �ı� ���
                else next_state = (bump_left) ? WALK_RIGHT : WALK_LEFT; //��ֹ� ������ ���� ��ȯ
            end
            else next_state = FALL_LEFT; //��������
        WALK_RIGHT:
            if(ground==1) begin //�� ��
                if(dig==1) next_state = DIG_RIGHT; //�� �ı� ���
                else next_state = (bump_right) ? WALK_LEFT : WALK_RIGHT; //��ֹ� ������ ���� ��ȯ
            end
            else next_state = FALL_RIGHT; //��������
        FALL_LEFT:
            if(ground==1) next_state = WALK_LEFT; //�������� ������ ���� ���� �������� �ȱ�
            else next_state = FALL_LEFT; //��� �������� ����
        FALL_RIGHT:
            if(ground==1) next_state = WALK_RIGHT; //�������� ������ ���� ���� �������� �ȱ�
            else next_state = FALL_RIGHT; //��� �������� ����
        DIG_LEFT:
            if(ground==1) next_state = DIG_LEFT; //�� ������ �ݴ������� ���� ������ ��� �ı�
            else next_state = FALL_LEFT; //�������� ���� Ȥ�� �������� ���߿��� ���� �Ĵ� ��� ���� 
        DIG_RIGHT:
            if(ground==1) next_state = DIG_RIGHT; //�� ������ �ݴ������� ���� ������ ��� �ı�
            else next_state = FALL_RIGHT; //�������� ���� Ȥ�� �������� ���߿��� ���� �Ĵ� ��� ���� 
    endcase
end

//�� ���¿� ���� output �� ���
assign walk_left = (present_state == WALK_LEFT);
assign walk_right = (present_state == WALK_RIGHT);
assign aaah = (present_state == FALL_LEFT)||(present_state == FALL_RIGHT);
assign digging = (present_state == DIG_LEFT)||(present_state == DIG_RIGHT);

endmodule
