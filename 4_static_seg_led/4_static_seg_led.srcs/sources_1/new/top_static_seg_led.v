`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/18 19:47:13
// Design Name: 
// Module Name: top_static_seg_led
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


module top_static_seg_led(
    input          clk    ,
    input          rst_n  ,

    output [5 : 0] seg_sel,
    output [7 : 0] seg_led
    );

parameter TIME_SHOW = 25'd25000000;

wire add_flag;

static_seg_led u_static_seg_led (
    .clk        (clk)     ,
    .rst_n      (rst_n)   ,
    .add_flag   (add_flag),
    .seg_sel    (seg_sel) ,
    .seg_led    (seg_led)
);

time_count #(.MAX_COUNT(TIME_SHOW)) u_time_count (
    .clk        (clk)     ,
    .rst_n      (rst_n)   ,
    .flag       (add_flag)
);

endmodule
