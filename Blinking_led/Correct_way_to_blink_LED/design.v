`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2026 01:46:56 PM
// Design Name: 
// Module Name: Blinking_led
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
module counter(
input clk,
output reg [24:0]count
);

always@(posedge clk)begin 
    count <= count+1'b1;
end
endmodule 

module Blinking_led(
input clk, 
output y
    );
    wire [24:0]val;
    counter count(clk,val);
    assign y = val[24];
endmodule
