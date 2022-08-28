`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/28 16:23:21
// Design Name: 
// Module Name: fifo_wr
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


module fifo_wr(
    input            clk         ,
    input            rst_n       ,
    
    input            almost_empty,
    input            almost_full ,
    output reg       fifo_wr_en  ,
    output reg [7:0] fifo_wr_data
    );
    
reg  [1:0] state           ;
reg        almost_empty_d0 ;
reg        almost_empty_syn;
reg  [3:0] dly_cnt         ;
wire       syn             ;

assign syn = ~almost_empty_syn & almost_empty_d0;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        almost_empty_d0  <= 1'b0;
        almost_empty_syn <= 1'b0;
    end
    else begin
        almost_empty_d0  <= almost_empty;
        almost_empty_syn <= almost_empty_d0;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        fifo_wr_en   <= 1'b0;
        fifo_wr_data <= 8'd0;
        state        <= 2'd0;
        dly_cnt      <= 4'd0;
    end
    else begin
        case(state)
            2'd0: begin
                if(syn) begin
                    state <= 2'd1;
                end
                else begin
                    state <= state;
                end
            end
            2'd1: begin
                if(dly_cnt == 4'd10) begin
                    dly_cnt    <= 4'd0;
                    state      <= 2'd2;
                    fifo_wr_en <= 1'b1;
                end
                else begin
                    dly_cnt <= dly_cnt + 4'd1;
                end
            end
            2'd2: begin
                if(almost_full) begin
                    fifo_wr_en   <= 1'b0;
                    fifo_wr_data <= 8'd0;
                    state        <= 2'd0;
                end
                else begin
                    fifo_wr_en <= 1'b1;
                    fifo_wr_data <= fifo_wr_data + 8'd1;
                end
            end
            default: state <= 2'd0;
        endcase
    end
end

endmodule
