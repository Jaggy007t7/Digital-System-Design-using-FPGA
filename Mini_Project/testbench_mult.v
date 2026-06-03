`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jageshwar
// 
// Create Date: 06/02/2026 04:40:49 PM
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb();
reg [7:0]a,b;
wire [15:0]c;

dadda_8x8_EXACT mult1(a,b,c);

integer i,j;
initial begin 
     $monitor("Time = %0d ns, a = %d, b = %d, c = %d", $time, a, b, c);
    for (i=0;i<=255;i=i+1)begin
        for(j=0;j<=255;j=j+1)begin 
            #1 a=i;b=j;
        end
    end
    #1 $finish;
end
endmodule
