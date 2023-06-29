`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/03 17:30:36
// Design Name: 
// Module Name: Min_Max_Finder
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


module Min_Max_Finder(
    Start, clk, ReadDataEven, ReadDataOdd,
    Max, Min, Valid
);

input Start; //1bit input
input clk; //1bit input
input [15:0] ReadDataEven, ReadDataOdd; //����Ǿ� �ִ� data
output reg [15:0] Max, Min; //read�� ���� �ִ�, �ּڰ�
output reg Valid; //��� ���ڿ� ���� �񱳰� ������ �ǹ�

reg [2:0] count; //Valid�� ����ϱ� ���� count

initial begin //�ʱⰪ ����
    Min = 16'b1111_1111_1111_1111;
    Max = 16'b0000_0000_0000_0000;
    count = 3'b0;
    Valid = 1'b0;
end

//clk�� ��� ������ �� ����
always @(posedge clk) begin
    if(Start) begin //Start ��ȣ�� ���� �� �ִ�, �ּڰ� ���
        if(ReadDataEven < ReadDataOdd) begin
            if(Min > ReadDataEven) Min <= ReadDataEven;
            if(Max < ReadDataOdd) Max <= ReadDataOdd;
        end
        else begin
            if(Min > ReadDataOdd) Min <= ReadDataOdd;
            if(Max < ReadDataEven) Max <= ReadDataEven;
        end
        count <= count + 3'b1;
    end
    
    //��� ���ڿ� ���� �񱳰� ���� ��� Valid: 1 
    if(count == 3'd3) Valid = 1'b1;
end

endmodule
