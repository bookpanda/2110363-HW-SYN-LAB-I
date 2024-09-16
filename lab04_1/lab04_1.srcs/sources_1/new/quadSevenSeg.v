`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2024 04:04:25 PM
// Design Name: 
// Module Name: quadSevenSeg
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


module quadSevenSeg(
    output [6:0] seg,
    output dp,
    output an0,
    output an1,
    output an2,
    output an3,
    input [3:0] num0,
    input [3:0] num1,
    input [3:0] num2,
    input [3:0] num3,
    input clk
    );
    
    reg [1:0] ps;
    reg [3:0] displayEn;
    reg [3:0] hexIn;
    
    assign dp = 0;
    assign {an0,an1,an2,an3} = ~displayEn; //common cathod, AN active low
    
    wire [6:0] segments;
    assign seg = segments;
    hexTo7Segment hex(segments, hexIn);
    
    always @(posedge clk) begin
        ps = ps+1;
    end
      
    always @(ps) begin
        case(ps)
            2'b00: begin displayEn = 4'b0001; hexIn = num0; end
            2'b01: begin displayEn = 4'b0010; hexIn = num1; end
            2'b10: begin displayEn = 4'b0100; hexIn = num2; end
            2'b11: begin displayEn = 4'b1000; hexIn = num3; end
        endcase
    end
    
endmodule
