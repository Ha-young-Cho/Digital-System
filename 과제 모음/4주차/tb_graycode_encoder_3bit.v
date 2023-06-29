`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/06 21:18:33
// Design Name: 
// Module Name: tb_graycode_encoder_3bit
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


module tb_graycode_encoder_3bit; //테스트벤치 선언

reg [2:0] decimal; //3bit input. 0~7까지의 수
reg enable; //1bit input
wire [6:0] therm; //7bit output이자 input
wire [2:0] out; //3bit output

initial begin //초기값 설정
    decimal = 3'b011;
    enable = 1'b1;
    //therm = 7'b0000000;
    //out = 3'b000;
end

always #10 decimal = decimal + 3'b001; //10ns마다 decimal에 3'b001을 더함
always #20 enable = ~enable; //20ns마다 enable 값을 반전시킴

//thermometer_encoder_7bit 모듈에 값을 전달하여 시뮬레이션
thermometer_encoder_7bit TE(decimal, therm, enable, out);

endmodule
