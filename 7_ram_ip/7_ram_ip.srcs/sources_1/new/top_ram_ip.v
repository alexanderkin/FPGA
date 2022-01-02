`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/02 18:43:33
// Design Name: 
// Module Name: top_ram_ip
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


module top_ram_ip(
    input clk,
    input rst_n
    );

wire       ram_en;
wire       ram_wea;
wire [4:0] ram_addr;
wire [7:0] ram_wr_data;
wire [7:0] ram_rd_data;

ram_rw u_ram_rw (
    .clk         (clk),
    .rst_n       (rst_n),
    .ram_en      (ram_en),
    .ram_wea     (ram_wea),
    .ram_addr    (ram_addr),
    .ram_rd_data (ram_rd_data),
    .ram_wr_data (ram_wr_data)
    );

blk_mem_gen_0 your_instance_name (
    .clka          (clk),         // input wire clka
    .ena           (ram_en),      // input wire ena
    .wea           (ram_wea),     // input wire [0 : 0] wea
    .addra         (ram_addr),    // input wire [4 : 0] addra
    .dina          (ram_wr_data), // input wire [7 : 0] dina
    .douta         (ram_rd_data)  // output wire [7 : 0] douta
    );

endmodule
