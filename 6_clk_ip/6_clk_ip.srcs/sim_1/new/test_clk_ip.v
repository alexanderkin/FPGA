`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/26 17:46:35
// Design Name: 
// Module Name: test_clk_ip
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


module test_clk_ip();

reg  clk        ;
reg  rst_n      ;

wire clk_100M   ;
wire clk_100M_dp;
wire clk_50M    ;
wire clk_25M    ;

initial begin
     clk   = 1'b0;
     rst_n = 1'b0;
#200 rst_n = 1'b1;
end

always #10 clk = ~clk;

clk_ip u_clk_ip(
    .clk         (clk)        ,
    .rst_n       (rst_n)      ,
    .clk_100M    (clk_100M)   ,
    .clk_100M_dp (clk_100M_dp),
    .clk_50M     (clk_50M)    ,
    .clk_25M     (clk_25M)
    );

endmodule
