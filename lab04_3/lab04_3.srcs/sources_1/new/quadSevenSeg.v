`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 12:26:12 AM
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
    output [3:0] an,
    input [3:0] num0,
    input [3:0] num1,
    input [3:0] num2,
    input [3:0] num3,
    input clk
    );
    
    assign dp = 1;
    
    reg [3:0] hexIn;
    
    reg [3:0] dispEn;
    assign an = ~dispEn;
   
    reg [1:0] ps = 0;
    always @(posedge clk) begin
        ps = ps+1;
    end
    
    always @(ps) begin
        case(ps)
            2'b00: begin dispEn=4'b0001; hexIn=num0; end //right
            2'b01: begin dispEn=4'b0010; hexIn=num1; end
            2'b10: begin dispEn=4'b0100; hexIn=num2; end
            2'b11: begin dispEn=4'b1000; hexIn=num3; end //left
        endcase
    end
    
    hexTo7Segment hex(seg, hexIn);
    
endmodule
