`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/18 20:51:19
// Design Name: 
// Module Name: count
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


module count(
    input               clk  ,
    input               rst_n,

    output reg [19 : 0] data ,
    output reg [5 : 0]  point,
    output reg          en   ,
    output reg          sign
    );

parameter MAX_NUM = 23'd5000000;

reg [22 : 0] cnt ;
reg          flag;
v
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt  <= 23'd0;
        flag <= 1'b0;
    end
    else if (cnt < MAX_NUM - 1'd1) begin
        cnt  <= cnt + 1'd1;
        flag <= 1'b0;
    end
    else begin
        cnt  <= 23'd0;
        flag <= 1'b1;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data  <= 20'b0;
        point <= 6'b000000;
        en    <= 1'b0;
        sign  <= 1'b0;
    end
    else begin
        point <= 6'b000000;
        en    <= 1'b1;
        sign  <= 1'b0;
        if (flag) begin
            if (data < 20'd999999)
                data <= data + 1'd1;
            else
                data <= 20'd0;
        end
    end
end

endmodule
