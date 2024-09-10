`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 12:05:39 PM
// Design Name: 
// Module Name: testBCDCounter
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


module testBCDCounter();
    reg clk;
    wire [3:0] out, bout, cout;
    reg up, down, set9, set0;
    
    always begin
        #10 clk = ~clk;
    end
    
    BCDCounter bcd(out, bout, cout, up, down, set9, set0, clk);
    
    initial begin
        #0 clk = 0; {up, down, set9, set0} = 4'b0001;
        #15
        #15 {up, down, set9, set0} = 4'b1000;
        #15 {up, down, set9, set0} = 4'b1000;
        #15 {up, down, set9, set0} = 4'b1000;
        #15 {up, down, set9, set0} = 4'b0100;
        #15 {up, down, set9, set0} = 4'b0100;
        #15 {up, down, set9, set0} = 4'b0010;
        #15 {up, down, set9, set0} = 4'b0001;
        #15 {up, down, set9, set0} = 4'b0010;
        #20 {up, down, set9, set0} = 4'b1000;
        #20 {up, down, set9, set0} = 4'b0100;
        #20 {up, down, set9, set0} = 4'b0001;
        #20 {up, down, set9, set0} = 4'b0100;
        #20 {up, down, set9, set0} = 4'b1000;
        #100 $finish;
    end
    
endmodule
