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


module updown_counter_4bit( //모듈 선언
    clk, rst_n, data, load, enable, select, out
);

input clk, rst_n; //1bit input
input [3:0] data; //4bit input
input load, enable, select; //1bit input
output reg [3:0] out; //4bit output

//clock이 상승 edge이거나, reset이 하강 edge일 때 동작    
always @(posedge clk or negedge rst_n) begin 
     if(!rst_n) out <= 4'b0000; //reset이 0이면 out을 0으로 초기화
     else begin //reset이 1일 때
         if(load == 1'b1) out <= data; //load가 1이면 out에 data를 로드
         else begin //load가 0일 때
             if(enable == 1'b1) begin //enable이 1일 때
                 case(select)
                     1'b1 : begin //select가 1일 때
                         out <= out + 4'b0001; //counter 값 증가
                     end
                     1'b0 : begin //select가 0일 때
                         out <= out - 4'b0001; //counter 값 감소
                     end
                 endcase
             end
             else out <= out; //enable이 0일 때 output 값 유지
         end
     end
end

endmodule
