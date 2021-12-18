`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/18 19:44:08
// Design Name: 
// Module Name: static_seg_led
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


module static_seg_led(
    input              clk     ,
    input              rst_n   ,
    input              add_flag,

    output reg [5 : 0] seg_sel ,
    output reg [7 : 0] seg_led
    );

reg [3 : 0] num;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        seg_sel <= 6'b111111;
    else
        seg_sel <= 6'b000000;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        num <= 4'h0;
    else if (add_flag) begin
        if (num < 4'hf)
            num <= num + 4'h1;
        else
            num <= 4'h0;
    end
    else
        num <= num;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        seg_led <= 8'b0;
    else begin
        case(num)
            4'h0    : seg_led <= 8'b11000000;
            4'h1    : seg_led <= 8'b11111001;
            4'h2    : seg_led <= 8'b10100100;
            4'h3    : seg_led <= 8'b10110000;
            4'h4    : seg_led <= 8'b10011001;
            4'h5    : seg_led <= 8'b10010010;
            4'h6    : seg_led <= 8'b10000010;
            4'h7    : seg_led <= 8'b11111000;
            4'h8    : seg_led <= 8'b10000000;
            4'h9    : seg_led <= 8'b10010000;
            4'ha    : seg_led <= 8'b10001000;
            4'hb    : seg_led <= 8'b10000011;
            4'hc    : seg_led <= 8'b11000110;
            4'hd    : seg_led <= 8'b10100001;
            4'he    : seg_led <= 8'b10000110;
            4'hf    : seg_led <= 8'b10001110;
            default : seg_led <= 8'b00000000;
        endcase
    end
end

endmodule
