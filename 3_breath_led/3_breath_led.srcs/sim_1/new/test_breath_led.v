`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/17 20:32:22
// Design Name: 
// Module Name: test_breath_led
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


module test_breath_led();

parameter T = 20;

reg          clk  ;
reg          rst_n;
wire [3 : 0] led  ;

initial begin
         clk   = 1'b0;
         rst_n = 1'b0;
#(T + 1) rst_n = 1'b1;
end

always #(T / 2) clk = ~clk;

breath_led u_breath_led (
    .clk   (clk  ),
    .rst_n (rst_n),
    .led   (led  )
);

endmodule
