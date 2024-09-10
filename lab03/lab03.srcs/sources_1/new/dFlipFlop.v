`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 11:43:33 AM
// Design Name: 
// Module Name: dFlipFlop
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


module dFlipFlop(
    output reg q,
    output reg notq,
    input d,
    input clk
    );
    
    always @(posedge clk)
        begin
            {q, notq} = {d, ~d};
        end
endmodule
