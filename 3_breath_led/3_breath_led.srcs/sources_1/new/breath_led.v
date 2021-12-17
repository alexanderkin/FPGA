`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/17 19:57:38
// Design Name: 
// Module Name: breath_led
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


module breath_led(
    input              clk  ,
    input              rst_n,
    output reg [3 : 0] led
    );

reg [15 : 0] period_cnt  ;
reg [15 : 0] duty_cycle  ;
reg          inc_dec_flag;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        period_cnt <= 16'd1;
    else if (period_cnt < 16'd50000)
    //else if (period_cnt < 16'd10)   //仿真代码
        period_cnt <= period_cnt + 1'b1;
    else
        period_cnt <= 16'd1;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        duty_cycle   <= 16'd0;
        inc_dec_flag <= 1'b0 ;
    end
    else begin
        if (period_cnt == 16'd50000) begin
        //if (period_cnt == 16'd10) begin   //仿真代码
            if (inc_dec_flag == 1'b0) begin
                if (duty_cycle == 16'd50000)
                //if (duty_cycle == 16'd10)   //仿真代码
                    inc_dec_flag <= 1'b1;
                else
                    duty_cycle <= duty_cycle + 16'd25;
                    //duty_cycle <= duty_cycle + 16'd1;   //仿真代码
            end
            else begin
                if (duty_cycle == 16'd0)
                    inc_dec_flag <= 1'b0;
                else
                    duty_cycle <= duty_cycle - 16'd25;
                    //duty_cycle <= duty_cycle - 16'd1;   //仿真代码
            end
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        led <= 4'b0000;
    else if (period_cnt >= duty_cycle) 
        led <= 4'b0000;
    else
        led <= 4'b1111;
end

endmodule
