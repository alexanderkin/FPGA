`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/02 18:03:27
// Design Name: 
// Module Name: ram_rw
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


module ram_rw(
    input            clk,
    input            rst_n,
    input      [7:0] ram_rd_data,

    output           ram_en,
    output           ram_wea,
    output reg [4:0] ram_addr,
    output reg [7:0] ram_wr_data
    );

reg [5:0] rw_cnt;

assign ram_en = rst_n;
assign ram_wea = (rw_cnt <= 6'd31 && ram_en == 1'b1) ? 1'b1 : 1'b0;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        rw_cnt <= 6'd0;
    else if (rw_cnt == 6'd63)
        rw_cnt <= 6'd0;
    else
        rw_cnt <= rw_cnt + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        ram_wr_data <= 6'd0;
    else if (rw_cnt <= 6'd31)
        ram_wr_data <= ram_wr_data + 1'b1;
    else
        ram_wr_data <= 6'd0;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        ram_addr <= 5'd0;
    else if (ram_addr == 5'd31)
        ram_addr <= 5'd0;
    else
        ram_addr <= ram_addr + 1'b1;
end

endmodule
