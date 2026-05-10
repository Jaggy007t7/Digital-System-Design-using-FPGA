`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2026 06:03:03 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input  [1:0] a,
    output reg [3:0] out
);

    parameter A = 2'b00,
              B = 2'b01,
              C = 2'b10,
              D = 2'b11;

    always @(*) begin
        case (a)
            A: out = 4'b0001;
            B: out = 4'b0010;
            C: out = 4'b0100;
            D: out = 4'b1000;
            default: out = 4'b0000;
        endcase
    end

endmodule
