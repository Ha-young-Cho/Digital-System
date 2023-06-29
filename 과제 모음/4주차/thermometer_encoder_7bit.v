`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/06 21:43:51
// Design Name: 
// Module Name: thermometer_encoder_7bit
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


module thermometer_encoder_7bit( //모듈 선언
    decimal, therm, enable, out
);

input [2:0] decimal; //3bit input. 0~7까지의 수
input enable; //1bit input
output reg [6:0] therm; //7bit output
output [2:0] out; //3bit output

always @({decimal}) begin //decimal값이 변화하면 동작
    // 0~7까지의 수를 7bit thermometer code로 변환
    case({decimal})
        3'b000: therm = 7'b0000000; // 10진수 0 (3bit 000)을 7bit로 변환
        3'b001: therm = 7'b0000001; // 10진수 1 (3bit 001)을 7bit로 변환
        3'b010: therm = 7'b0000011; // 10진수 2 (3bit 010)을 7bit로 변환
        3'b011: therm = 7'b0000111; // 10진수 3 (3bit 011)을 7bit로 변환
        3'b100: therm = 7'b0001111; // 10진수 4 (3bit 100)을 7bit로 변환
        3'b101: therm = 7'b0011111; // 10진수 5 (3bit 101)을 7bit로 변환
        3'b110: therm = 7'b0111111; // 10진수 6 (3bit 110)을 7bit로 변환
        3'b111: therm = 7'b1111111; // 10진수 7 (3bit 111)을 7bit로 변환
    endcase
end

//graycode_encoder_3bit 모듈에 값을 전달
graycode_encoder_3bit GE(enable, therm, out);

endmodule
