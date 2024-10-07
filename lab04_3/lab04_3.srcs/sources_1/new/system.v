`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 01:46:37 PM
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
    input btnU,
    input btnL,
    input btnD,
    input btnR,
    input clk
    );
    
    wire [19:0] tclk;
    assign tclk[0] = clk;
    wire targetClk;
    
    genvar c;
    generate for(c=0;c<19;c=c+1) begin
        clockDiv div(tclk[c+1],tclk[c]);
    end endgenerate
    assign targetClk = tclk[19];
    
    reg [3:0] num0,num1,num2,num3;
    quadSevenSeg qss(seg,dp,an,num0,num1,num2,num3,targetClk);
    
    reg [15:0] rom [2**10-1:0];
    initial $readmemb("rom.mem", rom);
    
    reg [1:0] mode;
    always @(posedge targetClk && (btnU || btnL || btnD || btnR)) begin
        case({btnU,btnL,btnD,btnR})
            4'b1000: mode = 0; // +
            4'b0100: mode = 1; // -
            4'b0010: mode = 2; // *
            4'b0001: mode = 3; // /
        endcase
        {num3,num2,num1,num0} = rom[{mode,sw}];
    end 
    
endmodule
