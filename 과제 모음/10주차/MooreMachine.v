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


module MooreMachine( //��� ����
    clk, rst_n, X,
    Y
);

input clk, rst_n, X; //1bit input
output Y; //1bit output

//state�� local parameter�� ����
localparam S0 = 2'b00, 
           S1 = 2'b01,
           S2 = 2'b10;

//2bit�� state ǥ��
reg [1:0] present_state, next_state;

//combinational logic���� ���� ���� ���
always @(present_state or X) begin //present_state�� X ��ȣ�� �����ϸ�
    case(present_state)
        S0: if(X) next_state = S1; else next_state = S0;
        S1: if(X) next_state = S2; else next_state = S0;
        S2: if(X) next_state = S2; else next_state = S0;
        default: next_state = S0;
    endcase
end

//sequential logic���� ���� ���� ������Ʈ
//clk�� ��� �����ų� rst_n�� �ϰ� ������ �� ����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) present_state <= S0; //rst_n�� 0�� ��
    else present_state <= next_state; 
end

//��� ���
assign Y = (present_state == S1);

endmodule
