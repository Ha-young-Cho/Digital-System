`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 20:36:34
// Design Name: 
// Module Name: Quantization
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


module Quantization(
    sum, c_out,
    out1
);
    
input [3:0] sum; //4bit µ¡¼À °á°ú
input c_out; //µ¡¼À ÀÚ¸® ¿Ã¸²
output reg [3:0] out1; //4bit output

initial begin //ÃÊ±âÈ­
    out1 = 4'b0000;
end

always @(*) begin
    //c_out °ª¿¡ µû¶ó out1 °ª º¯È­
    if(c_out == 0) out1 <= sum;
    else out1 <= {c_out, sum[3:1]}; //concat + slice
end
    
endmodule
