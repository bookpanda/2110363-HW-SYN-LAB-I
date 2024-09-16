`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2024 03:49:17 PM
// Design Name: 
// Module Name: singlePulser
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


module singlePulser(
    output reg out,
    input pushed,
    input clk
    );
    
    reg state = 0;
    
    always @(posedge clk) begin
        out = 0;
        case({pushed, state})
            2'b00: ;
            2'b01: state = 0;
            2'b10: begin
                state = 1;
                out = 1;
            end
            2'b11: ;
        endcase
    end
    
endmodule
