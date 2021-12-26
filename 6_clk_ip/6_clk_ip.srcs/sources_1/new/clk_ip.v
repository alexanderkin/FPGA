`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/26 17:37:35
// Design Name: 
// Module Name: clk_ip
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


module clk_ip(
    input clk,
    input rst_n,

    output clk_100M,
    output clk_100M_dp,
    output clk_50M,
    output clk_25M
    );

clk_wiz_0 instance_name(
    // Clock out ports
    .clk_100M         (clk_100M),        // output clk_100M
    .clk_100M_dp      (clk_100M_dp),     // output clk_100M_dp
    .clk_50M          (clk_50M),         // output clk_50M
    .clk_25M          (clk_25M),         // output clk_25M
    // Status and control signals
    .resetn           (rst_n),           // input resetn
    .locked           (locked),          // output locked
    // Clock in ports
    .clk_in1          (clk)              // input clk_in1
    );

endmodule
