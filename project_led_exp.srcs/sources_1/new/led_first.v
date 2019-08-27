`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2019/08/27 13:56:15
// Design Name:
// Module Name: led_first
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


module led_first(
           input        clock,
           output [7:0] led
       );
parameter CNT_1S = 27'd99_999_999;

reg [7:0] led_tmp;

assign led = led_tmp;

//count
reg [26:0] cnt;
wire cnt_eq_1s = cnt == CNT_1S;

always @(posedge clock) begin
    if(cnt_eq_1s) begin
        cnt <= 27'd0;
    end
    else begin
        cnt <= cnt+1'b1;
    end
end

always @(posedge clock) begin
    if(cnt_eq_1s) begin
        led_tmp <= {led_tmp[6:0],led_tmp[7]};
    end
end

/*
initial
begin
    forever
    begin
        #10 led_tmp = 8'h01;
        #10 led_tmp = 8'h02;
        #10 led_tmp = 8'h04;
        #10 led_tmp = 8'h08;
        #10 led_tmp = 8'h10;
        #10 led_tmp = 8'h20;
        #10 led_tmp = 8'h40;
        #10 led_tmp = 8'h80;
    end
end
*/
endmodule
