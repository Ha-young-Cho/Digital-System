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


module PRPG( //모듈 선언
    clk, rst_n,
    seed, qout,
    sequence, count, num, valid
);

input clk, rst_n; // 1bit input
input [0:n-1] seed; //가장 처음 초기화된 값
output reg [0:n-1] qout; //shift register의 output
output reg sequence; //생성된 bit sequence
output reg [0:n-1] count; //bit sequence에서 1의 개수 count
output reg [0:n-1] num; //다음 clk cycle에서 나타내기 위한 1의 개수
output reg valid; //valid 신호

reg XOR; //parameter에 따라 다른 값을 가지기 때문에 사용하는 reg

parameter n =4;

always @(*) begin //always 구문에서 사용되는 모든 신호에 대해 동작
    case(n) //parameter에 따른 shift register 연산 
        4: XOR = qout[3]^qout[2];
        8: XOR = qout[7]^qout[5]^qout[4]^qout[2];
        16: XOR = qout[15]^qout[11]^qout[6]^qout[1];
        32: XOR = qout[31]^qout[21]^qout[1]^qout[0];
    endcase
end

//clk가 상승 엣지거나 rst_n이 하강 엣지일 때 동작
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin //rst_n이 0일 경우 초기화
        qout <= seed;
        count <= {n{1'b0}};
        num <= {n{1'b0}};
        sequence <= 1'b0;
        valid <= 1'b0; 
    end
    else begin //rst_n이 1인 경우
        qout <= {XOR, qout[0:n-2]}; //shift register
        sequence <= qout[n-1]; //bit sequence 생성
        
        //bit sequence에서 1의 개수 count
        if(qout[n-1] == 1) count <= count + 1; 
        else count <= count;
        
        if(qout == seed) begin //2^n -1 개의 bit sequence가 모두 출력된 뒤
            num <= count; //다음 cycle에서 패턴 내 1의 개수 출력
            if(count == 0) valid <= 0; //맨 처음 초기화에서 valid가 1 뜨는 것 방지
            else valid <= 1;
            count <= qout[n-1]; //새로운 cycle이 시작되었을 때 첫 count 값 계산
        end
        else begin //2^n - 1개 패턴이 생성 중일 때
            num <= 0;
            valid <= 0;
        end
    end    
end

endmodule
