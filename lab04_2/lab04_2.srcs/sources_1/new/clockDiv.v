`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2024 10:06:29 PM
// Design Name: 
// Module Name: clockDiv
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


module clockDiv(
    output reg clkDiv,
    input clk
    );
    
    initial clkDiv = 0;
    
    always @(posedge clk) begin
        clkDiv = ~clkDiv;
    end
     
endmodule
