`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 01:28:35 PM
// Design Name: 
// Module Name: fullAdderDataFlow
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


module fullAdderDataFlow(
    output cout,
    output s,
    input a,
    input b,
    input cin
    );

assign {cout,s} = a + b + cin;
    
endmodule
