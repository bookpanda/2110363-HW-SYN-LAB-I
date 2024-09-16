`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2024 04:22:12 PM
// Design Name: 
// Module Name: singlePortRAM
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


module singlePortRAM(
    output reg [7:0] addr,
    output reg [7:0] dout,
    input [7:0] din,
    input we, oe, reset, clk //write enable (push), output enable (pop)
    );
    
    reg [7:0] mem [255:0];
    initial begin
        dout = 0;
        addr = 0;
    end
    
    always @(posedge clk) begin
        if(we) begin
            mem[addr] = din;
            addr = addr+1;
        end
        if(reset || (oe && addr == 0)) begin
            dout = 0; 
            addr = 0;
        end
        if(oe && addr > 0) begin
            addr = addr-1;
            dout = mem[addr];
            mem[addr] = 0;
        end
    end
    
endmodule
