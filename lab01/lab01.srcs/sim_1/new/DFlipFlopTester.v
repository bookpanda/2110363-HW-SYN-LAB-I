`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 01:39:20 PM
// Design Name: 
// Module Name: DFlipFlopTester
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


module DFlipFlopTester(

    );

reg clock, nreset, d;
DFlipFlop D1(clock,nreset,d,q);
always
#10 clock=~clock;
initial
begin
//$dumpfile("testDFlipFlop.dump");
//$dumpvars(1,D1);
#0 d=0;
clock=0;
nreset=0;
#92 nreset=1;
#10 nreset=0;
#1000 $finish;
end
always
#8 d=~d;

    
endmodule
