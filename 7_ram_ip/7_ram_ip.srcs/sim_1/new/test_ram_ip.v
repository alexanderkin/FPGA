`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/02 19:20:47
// Design Name: 
// Module Name: test_ram_ip
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


module test_ram_ip();

reg clk;
reg rst_n;

initial begin
     clk   = 1'b0;
     rst_n = 1'b0;
#200 rst_n = 1'b1;
end

always #10 clk = ~clk;

top_ram_ip u_top_ram_ip (
    .clk   (clk),
    .rst_n (rst_n)
    );

endmodule
