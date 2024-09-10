`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 11:55:21 AM
// Design Name: 
// Module Name: BCDCounter
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


module BCDCounter(
    output reg [3:0] out,
    output reg bout,
    output reg cout,
    input up,
    input down,
    input set9,
    input set0,
    input clk
    );
    
    always @(posedge clk) begin
        case({up, down, set9, set0})
            4'b0001: out = 0;
            4'b0010: out = 9;
            4'b1000: begin
                bout = out == 9;
                out = (out+1)%10;
                end
            4'b0100: begin
                bout = out == 0;
                out = (out+9)%10;
                end
        endcase
    end
endmodule
