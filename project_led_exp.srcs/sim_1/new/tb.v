`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/08/27 14:08:26
// Design Name: 
// Module Name: tb
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


module tb(
    );
	reg clock, rst;
	initial
	begin
		clock = 1'b0;
        rst = 1'b0;
	end
	always #5 clock = ~clock;
    always #7 rst = 1'b1;
	wire [7:0] led;

	led_exp  u_led(
        .clk(clock),
        .rst(rst),
        .led(  led   )
    );
endmodule
