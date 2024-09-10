`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 11:48:25 AM
// Design Name: 
// Module Name: testDFlipFlop
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


module testDFlipFlop();
    wire q, notq;
    reg clk, d;
    
    always
        #10 clk = ~clk;
    
    dFlipFlop dff(q, notq, d, clk);
    
    initial begin
        #0 clk = 0;
        #10 d = 1;
        #20 d = 0;
        #15 d = 1;
        #15 d = 0;
        
        #200 $finish;
    end
    
endmodule
