`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 12:12:20 PM
// Design Name: 
// Module Name: ram
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


module ram(
    output reg [7:0] dout,
    input [7:0] din,
    input [7:0] addr,
    input we, oe, clk
    );
    
    reg [7:0] mem [255:0];
    
    always @(posedge clk) begin
        if(we) begin
            mem[addr] <= din;
        end
        dout = oe ? mem[addr] : 8'b00000000;
    end
endmodule
