`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/06 19:01:12
// Design Name: 
// Module Name: updown_counter_4bit
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


module updown_counter_4bit( //��� ����
    clk, rst_n, data, load, enable, select, out
);

input clk, rst_n; //1bit input
input [3:0] data; //4bit input
input load, enable, select; //1bit input
output reg [3:0] out; //4bit output

//clock�� ��� edge�̰ų�, reset�� �ϰ� edge�� �� ����    
always @(posedge clk or negedge rst_n) begin 
     if(!rst_n) out <= 4'b0000; //reset�� 0�̸� out�� 0���� �ʱ�ȭ
     else begin //reset�� 1�� ��
         if(load == 1'b1) out <= data; //load�� 1�̸� out�� data�� �ε�
         else begin //load�� 0�� ��
             if(enable == 1'b1) begin //enable�� 1�� ��
                 case(select)
                     1'b1 : begin //select�� 1�� ��
                         out <= out + 4'b0001; //counter �� ����
                     end
                     1'b0 : begin //select�� 0�� ��
                         out <= out - 4'b0001; //counter �� ����
                     end
                 endcase
             end
             else out <= out; //enable�� 0�� �� output �� ����
         end
     end
end

endmodule
