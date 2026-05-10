`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2026 06:41:45 PM
// Design Name: 
// Module Name: counter
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
    input clk,          // 125 MHz clock on PYNQ-Z2
    input btn,         // push button
    output reg [3:0] led
);

    // -----------------------------
    // 1. Synchronize button (avoid metastability)
    // -----------------------------
    reg btn_sync1, btn_sync2;

    always @(posedge clk) begin
        btn_sync1 <= btn;
        btn_sync2 <= btn_sync1;
    end

    wire btn_clean = btn_sync2;

    // -----------------------------
    // 2. Debounce logic (~20ms)
    // -----------------------------
    reg [20:0] debounce_cnt;
    reg btn_stable;

    always @(posedge clk) begin
        if (btn_clean != btn_stable) begin
            debounce_cnt <= debounce_cnt + 1;

            // ~20ms delay (125MHz clock → 2.5M cycles)
            if (debounce_cnt == 21'd2_500_000) begin
                btn_stable <= btn_clean;
                debounce_cnt <= 0;
            end
        end
        else begin
            debounce_cnt <= 0;
        end
    end

    // -----------------------------
    // 3. Edge detection (rising edge)
    // -----------------------------
    reg btn_prev;

    wire btn_posedge = btn_stable & ~btn_prev;

    always @(posedge clk) begin
        btn_prev <= btn_stable;
    end

    // -----------------------------
    // 4. 4-bit counter
    // -----------------------------
    always @(posedge clk) begin
        if (btn_posedge) begin
            led <= led + 1;
        end
    end

endmodule
