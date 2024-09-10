`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 12:36:43 PM
// Design Name: 
// Module Name: testSinglePulser
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


module testSinglePulser();
    wire out;
    reg clk, in;
    
    singlePulser sp(out, in, clk);
    
    always begin
        #10 clk = ~clk;
    end
    
    initial begin
        #0 clk = 0; in = 0;
        #15 in = 1;
        #40 in = 0;
        #30 in = 1;
        #50 $finish;
    end
endmodule
