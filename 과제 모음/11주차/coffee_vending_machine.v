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
input coin; //���� �Է¿� ���� ��ȣ
input buy; //Ŀ�� ���ſ� ���� ��ȣ
output coffee; //Ŀ�� ����
output return; //���� ��ȯ

localparam INITIAL = 3'b000, //�ʱ�ȭ ����
           COIN1 = 3'b001,//100�� �Է�
           COIN2 = 3'b010, //200�� �Է�
           COIN3 = 3'b011,//300�� �Է�
           COINOVER3 = 3'b100, //300�� �ʰ� �Է�
           COFFEE = 3'b101; // COFFEE ����
           
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

//clk�� ��¿����ų� rst_n�� �ϰ������� �� ����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) present_state <= INITIAL; //�ʱ� state�� INITIAL�� ����
    else present_state <= next_state;
end

//���� output ���
assign coffee = (present_state == COFFEE);
assign return = (present_state == INITIAL); 

endmodule
