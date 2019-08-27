`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2019/08/27 11:50:32
// Design Name:
// Module Name: led_exp
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

`define RST_ENABLE 0
module led_exp(
           input clk,
           input rst,
           output reg [7:0]led
       );

reg[29:0] cnt;

always @ (posedge clk) begin
    if (rst == `RST_ENABLE) begin
        cnt <= 30'b0;
    end
    else begin
        cnt = cnt + 1;
    end
end

always @ (posedge clk) begin
    if (rst == `RST_ENABLE) begin
        led <= 8'b0;
    end
    else begin
        case(cnt[28:26])
            3'b000:
                led <= 8'b0000_0001;
            3'b001:
                led <= 8'b0000_0010;
            3'b010:
                led <= 8'b0000_0100;
            3'b011:
                led <= 8'b0000_1000;
            3'b100:
                led <= 8'b0001_0000;
            3'b101:
                led <= 8'b0010_0000;
            3'b110:
                led <= 8'b0100_0000;
            3'b111:
                led <= 8'b1000_0000;
        endcase
    end
end

endmodule
