`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2024 10:10:51 PM
// Design Name: 
// Module Name: system
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


module system(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input [4:0] sw,
    input clk
    );
    
    wire [19:0] tclk;
    assign tclk[0] = clk;
    wire targetClk;
    
    genvar c;
    generate for(c=0;c<19;c=c+1) begin
        clockDiv div(tclk[c+1], tclk[c]);
    end endgenerate
    assign targetClk = tclk[19];
    
    reg [3:0] num3,num2,num1,num0; //left to right
    
    quadSevenSeg qss(seg,dp,an,num0,num1,num2,num3,targetClk);
    
    reg [7:0] rom[2**5-1:0];
    initial $readmemb("rom.mem", rom);
    
    always @(posedge targetClk) begin
        {num3,num2,num1,num0} = {rom[sw], 8'b00000000};
    end
    
endmodule
