`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/15 21:19:00
// Design Name: 
// Module Name: test_flow_led
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


module test_flow_led;

parameter T = 20;

reg clk;
reg rst_n;

wire [3:0] led;

initial begin
    clk            = 1'd0;
    rst_n          = 1'd0;
    #(T + 1) rst_n = 1'd1;
end

always #(T / 2) clk = ~clk;

flow_led u_flow_led (
    .clk      (clk),
    .rst_n    (rst_n),
    .led      (led)
);

endmodule
