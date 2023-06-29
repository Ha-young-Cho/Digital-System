`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 02:48:34
// Design Name: 
// Module Name: PRPG
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


module PRPG( //��� ����
    clk, rst_n,
    seed, qout,
    sequence, count, num, valid
);

input clk, rst_n; // 1bit input
input [0:n-1] seed; //���� ó�� �ʱ�ȭ�� ��
output reg [0:n-1] qout; //shift register�� output
output reg sequence; //������ bit sequence
output reg [0:n-1] count; //bit sequence���� 1�� ���� count
output reg [0:n-1] num; //���� clk cycle���� ��Ÿ���� ���� 1�� ����
output reg valid; //valid ��ȣ

reg XOR; //parameter�� ���� �ٸ� ���� ������ ������ ����ϴ� reg

parameter n =4;

always @(*) begin //always �������� ���Ǵ� ��� ��ȣ�� ���� ����
    case(n) //parameter�� ���� shift register ���� 
        4: XOR = qout[3]^qout[2];
        8: XOR = qout[7]^qout[5]^qout[4]^qout[2];
        16: XOR = qout[15]^qout[11]^qout[6]^qout[1];
        32: XOR = qout[31]^qout[21]^qout[1]^qout[0];
    endcase
end

//clk�� ��� �����ų� rst_n�� �ϰ� ������ �� ����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin //rst_n�� 0�� ��� �ʱ�ȭ
        qout <= seed;
        count <= {n{1'b0}};
        num <= {n{1'b0}};
        sequence <= 1'b0;
        valid <= 1'b0; 
    end
    else begin //rst_n�� 1�� ���
        qout <= {XOR, qout[0:n-2]}; //shift register
        sequence <= qout[n-1]; //bit sequence ����
        
        //bit sequence���� 1�� ���� count
        if(qout[n-1] == 1) count <= count + 1; 
        else count <= count;
        
        if(qout == seed) begin //2^n -1 ���� bit sequence�� ��� ��µ� ��
            num <= count; //���� cycle���� ���� �� 1�� ���� ���
            if(count == 0) valid <= 0; //�� ó�� �ʱ�ȭ���� valid�� 1 �ߴ� �� ����
            else valid <= 1;
            count <= qout[n-1]; //���ο� cycle�� ���۵Ǿ��� �� ù count �� ���
        end
        else begin //2^n - 1�� ������ ���� ���� ��
            num <= 0;
            valid <= 0;
        end
    end    
end

endmodule
