`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/18 19:49:59
// Design Name: 
// Module Name: time_count
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


module time_count(
    input      clk  ,
    input      rst_n,

    output reg flag
    );

parameter MAX_COUNT = 25'd25000000;
reg [24 : 0] cnt;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        flag <= 1'b0;
        cnt  <= 25'd0;
    end
    else if (cnt < MAX_COUNT - 25'd1) begin
        flag <= 1'b0;
        cnt  <= cnt + 25'd1;
    end
    else begin
        flag <= 1'b1;
        cnt  <= 25'd0;
    end
end

endmodule
