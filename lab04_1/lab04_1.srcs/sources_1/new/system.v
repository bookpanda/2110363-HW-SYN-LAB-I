`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2024 04:43:23 PM
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
    input [7:0] sw,
    input btnU, //push
    input btnC, //pop
    input btnD, //empty
    input clk
    );
    
    wire [3:0] num0,num1,num2,num3;
    wire an0,an1,an2,an3;
    assign an = {an0,an1,an2,an3};
    
    wire targetClk;
    wire [19:0] tclk;
    assign tclk[0] = clk;
    
    genvar c;
    generate for(c=0;c<19;c=c+1) begin
        clockDiv(tclk[c+1], tclk[c]);
    end endgenerate
    assign targetClk = tclk[19];
    
    quadSevenSeg qss(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,targetClk);
    
    wire push,pop,reset;
    singlePulser(push,btnU,targetClk);
    singlePulser(pop,btnC,targetClk);
    singlePulser(reset,btnD,targetClk);
    
    reg [7:0] addr = 0;
    
    singlePortRAM stack({num1,num0},{num3,num2},sw,push,pop,reset,targetClk);
    
endmodule
