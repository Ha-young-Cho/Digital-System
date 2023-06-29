`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 16:02:39
// Design Name: 
// Module Name: AddressEncoder
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


module AddressEncoder(
//15bit의 RingCounter 값을 0~14 사이의 값으로 변환하는 모듈
    AddrIn, 
    AddrOut
);
parameter DATANUM = 15;
parameter ADDRESS = 4;

input [DATANUM-1:0] AddrIn; //15bit input
output reg [ADDRESS-1:0] AddrOut; //4bit output

always @(*) begin //아래 모든 신호 중 하나라도 변화하면 동작
    case(AddrIn) //AddrIn에 대한 case문
        15'b100_0000_0000_0000: AddrOut = 4'b0000;
        15'b000_0000_0000_0001: AddrOut = 4'b0001;
        15'b000_0000_0000_0010: AddrOut = 4'b0010;
        15'b000_0000_0000_0100: AddrOut = 4'b0011;
        15'b000_0000_0000_1000: AddrOut = 4'b0100;
        15'b000_0000_0001_0000: AddrOut = 4'b0101;
        15'b000_0000_0010_0000: AddrOut = 4'b0110;
        15'b000_0000_0100_0000: AddrOut = 4'b0111;
        15'b000_0000_1000_0000: AddrOut = 4'b1000;
        15'b000_0001_0000_0000: AddrOut = 4'b1001;
        15'b000_0010_0000_0000: AddrOut = 4'b1010;
        15'b000_0100_0000_0000: AddrOut = 4'b1011;
        15'b000_1000_0000_0000: AddrOut = 4'b1100;
        15'b001_0000_0000_0000: AddrOut = 4'b1101;
        15'b010_0000_0000_0000: AddrOut = 4'b1110;
        default: AddrOut = 4'b1111; //위 경우가 아닐 때 기본값
    endcase
end

endmodule
