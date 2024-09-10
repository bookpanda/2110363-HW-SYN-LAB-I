`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 12:43:16 PM
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
    input btnU, // set 9999
    input btnC, // reset 0000
    input [7:0] sw, // even idx = -, odd idx = +
    input clk
    
    );
    
    wire [19:0] tclk;
    wire targetClk;
    assign tclk[0] = clk;
    
    genvar c;
    generate for(c=0;c<19;c=c+1) begin
        clockDiv cd(tclk[c+1], tclk[c]);
    end endgenerate
    
    assign targetClk = tclk[19];
    
    //debounce = attach DFF 2 times to each sw
    wire [8:0] d, notd, d2, notd2;
    generate for(c=0;c<8;c=c+1) begin
        dFlipFlop dff2(d2[c], notd2[c], sw[c], targetClk);
        dFlipFlop dff(d[c], notd[c], d2[c], targetClk);
    end endgenerate
    
    // attach singlePulser to each d (DFFed switches)
    wire up0, up1, up2, up3, down0, down1, down2, down3;
    singlePulser spd0(down0, d[0], targetClk);
    singlePulser spu0(up0, d[1], targetClk);
    singlePulser spd1(down1, d[2], targetClk);
    singlePulser spu1(up1, d[3], targetClk);
    singlePulser spd2(down2, d[4], targetClk);
    singlePulser spu2(up2, d[5], targetClk);
    singlePulser spd3(down3, d[6], targetClk);
    singlePulser spu3(up3, d[7], targetClk);
    
    wire [3:0] bout, cout;
    wire [3:0] num0, num1, num2, num3;
    BCDCounter(num0, bout[0], cout[0], up0, down0, btnU|cout[3], btnC|bout[3], targetClk);
    BCDCounter(num1, bout[1], cout[1], up1, down1, btnU|cout[3], btnC|bout[3], targetClk);
    BCDCounter(num2, bout[2], cout[2], up2, down2, btnU|cout[3], btnC|bout[3], targetClk);
    BCDCounter(num3, bout[3], cout[3], up3, down3, btnU|cout[3], btnC|bout[3], targetClk);
    
    quadSevenSeg qss(seg, dp, an[0], an[1], an[2], an[3], num0, num1, num2, num3, targetClk);
   
endmodule
