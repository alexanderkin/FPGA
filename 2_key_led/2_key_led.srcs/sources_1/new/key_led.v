`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/16 19:28:15
// Design Name: 
// Module Name: key_led
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


module key_led(
    input              clk  ,
    input              rst_n,
    input      [3 : 0] key  ,
    output reg [3 : 0] led
    );

reg [23 : 0] cnt;
reg [1 : 0]  led_control;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        cnt <= 24'd0;
    else if (cnt < 24'd10000000 - 24'd1)
    //else if (cnt < 24'd10 - 24'd1)
        cnt <= cnt + 24'd1;
    else
        cnt <= 24'd0;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        led_control <= 2'b00;
    else if (cnt == 24'd10000000 - 24'd1)
    //else if (cnt == 24'd10 - 24'd1)
        led_control = led_control + 1'b1;
    else
        led_control <= led_control;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        led <= 4'b0000;
    else if (key[0] == 1'd0)
        case (led_control)
            2'b00   : led <= 4'b1000;
            2'b01   : led <= 4'b0100;
            2'b10   : led <= 4'b0010;
            2'b11   : led <= 4'b0001;
            default : led <= 4'b0000;
        endcase
    else if (key[1] == 1'd0)
        case (led_control)
            2'b00   : led <= 4'b0001;
            2'b01   : led <= 4'b0010;
            2'b10   : led <= 4'b0100;
            2'b11   : led <= 4'b1000;
            default : led <= 4'b0000;
        endcase
    else if (key[2] == 1'd0)
        case (led_control)
            2'b00   : led <= 4'b1111;
            2'b01   : led <= 4'b0000;
            2'b10   : led <= 4'b1111;
            2'b11   : led <= 4'b0000;
            default : led <= 4'b0000;
        endcase
    else if (key[3] == 1'd0)
        led <= 4'b1111;
    else
        led <= 4'b0000;
end

endmodule
