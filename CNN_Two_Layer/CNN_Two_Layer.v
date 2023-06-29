`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/16 12:17:26
// Design Name: 
// Module Name: CNN_Two_Layer
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


module CNN_Two_Layer(
    clk, rst_n,
    Start1, Image, Filter1, ReadEn1,
    Start2, Filter2, ReadEn2,
    ConvResult
);
input clk;
input rst_n;
// Layer 1 input signals
input Start1;
input [3:0] Image;
input signed [3:0] Filter1;
input ReadEn1;
// Layer 2 input signals
input Start2;
input signed [9:0] Filter2;
input ReadEn2;
// Layer 2 output signal
output signed [21:0] ConvResult;

//layer 1에서 layer 2를 연결하는 wire
wire [9:0] ConvResult_to_Image;
//layer 1
CNN_Single_Layer Layer1(clk, rst_n, Start1, Image, Filter1, ReadEn1, ConvResult_to_Image);
//layer 2. parameter를 통해 bitwidth 조절
CNN_Single_Layer #(.INPUT(10), .FILTER(10), .RESULT(22), .ADDRESS(4), .DATAWIDTH(20), .DATANUM(15)) Layer2(clk, rst_n, Start2, ConvResult_to_Image, Filter2, ReadEn2, ConvResult);
    
endmodule
