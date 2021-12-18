`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/18 20:50:50
// Design Name: 
// Module Name: top_seg_led
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


module top_seg_led(
    input          clk    ,
    input          rst_n  ,

    output [5 : 0] seg_sel,
    output [7 : 0] seg_led
    );

wire [19 : 0] data ;
wire [5 : 0]  point;
wire          en   ;
wire          sign ;

seg_led u_seg_led (
    .clk         (clk)    ,
    .rst_n       (rst_n)  ,
    .data        (data)   ,
    .point       (point)  ,
    .en          (en)     ,
    .sign        (sign)   ,
    .seg_sel     (seg_sel),
    .seg_led     (seg_led)
);

count u_count (
    .clk         (clk)    ,
    .rst_n       (rst_n)  ,
    .data        (data)   ,
    .point       (point)  ,
    .en          (en)     ,
    .sign        (sign)
);

endmodule
