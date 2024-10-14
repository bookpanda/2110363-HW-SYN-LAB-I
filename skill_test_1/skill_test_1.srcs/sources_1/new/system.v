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
    input [13:0] sw, // even idx = -, odd idx = +
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
    
    reg [13:0] val = 0;
    reg [3:0] n0, n1, n2, n3, n4;
    always @(posedge clk) begin
        val = 0;
        if(sw[0]) begin
            val[0] = 1;
        end
        if(sw[1]) begin
            val[1] = 1;
        end
        if(sw[2]) begin
            val[2] = 1;
        end
        if(sw[3]) begin
            val[3] = 1;
        end
        if(sw[4]) begin
            val[4] = 1;
        end
        if(sw[5]) begin
            val[5] = 1;
        end
        if(sw[6]) begin
            val[6] = 1;
        end
        if(sw[7]) begin
            val[7] = 1;
        end
        if(sw[8]) begin
            val[8] = 1;
        end
        if(sw[9]) begin
            val[9] = 1;
        end
        if(sw[10]) begin
            val[10] = 1;
        end
        if(sw[11]) begin
            val[11] = 1;
        end
        if(sw[12]) begin
            val[12] = 1;
        end
        if(sw[13]) begin
            val[13] = 1;
        end
    end
    
     always @(posedge clk) begin
        n0 = val % 10;
        n1 = (val/10)%10;
        n2 = (val/100)%10;
        n3 = (val/1000)%10;
        n4 = (val/10000)%10;
        if(n4 > 0) begin
            n0 = 4'b1010;
            n1 = 4'b1010;
            n2 = 4'b1010;
            n3 = 4'b1010;
        end
    end
    
    wire [3:0] bout, cout;
    
    quadSevenSeg qss(seg, dp, an, n0, n1, n2, n3, targetClk);
   
endmodule
