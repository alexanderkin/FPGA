`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/15 21:12:58
// Design Name: 
// Module Name: flow_led
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


module flow_led(
    input        clk,
    input        rst_n,
    output reg [3:0] led
    );
    
//每隔0.2s流水
reg [23:0] counter;

//分频计数，计时0.2s，仿真用24'd10
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        counter <= 24'd0;
    else if (counter < 24'd10000000 - 1'd1)
    //else if (counter < 24'd10 - 1'd1)
        counter <= counter + 1'd1;
    else
        counter <= 24'd0;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        led <= 4'b0001;
    else if (counter == 24'd10000000 - 1'd1)
    //else if (counter == 24'd10 - 1'd1)   //仿真使用
        led[3:0] <= { led[2:0], led[3] };
    else
        led <= led;
end

endmodule
