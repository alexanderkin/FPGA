`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/16 19:57:21
// Design Name: 
// Module Name: test_key_led
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


module test_key_led();

parameter T = 20;

reg  [3 : 0] key  ;
reg          clk  ;
reg          rst_n;
wire [3 : 0] led  ;

initial begin
     key    <= 4'b1111;
     clk    <= 1'b0   ;
     rst_n  <= 1'b0   ;
  
#T   rst_n  <= 1'b1   ;
  
     key[0] <= 1'b0   ;
#800 key[0] <= 1'b1   ;

     key[1] <= 1'b0   ;
#800 key[1] <= 1'b1   ;

     key[2] <= 1'b0   ;
#800 key[2] <= 1'b1   ;

     key[3] <= 1'b0   ;
#800 key[3] <= 1'b1   ;

end

always #(T / 2) clk <= ~clk;

key_led u_key_led (
    .clk   (clk),
    .rst_n (rst_n),
    .key   (key),
    .led   (led)
);

endmodule
