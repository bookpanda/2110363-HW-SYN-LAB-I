`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2024 09:41:42 PM
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
    input in,
    input clk
    );
    
    reg state = 0;
    initial out = 0;
    
    always @(posedge clk) begin
        out = 0;
        case({in,state})
            2'b00: ;
            2'b01: state = 0;
            2'b10: begin out = 1; state = 1; end
            2'b11: ;
        endcase
    end
endmodule
