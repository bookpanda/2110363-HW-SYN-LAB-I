`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 02:16:44 PM
// Design Name: 
// Module Name: shiftABTester
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



module shiftABTester();

reg clock, d;
wire [1:0] qa, qb;
shiftA A(qa,clock,d);
shiftB B(qb,clock,d);
always
#10 clock=~clock;
initial
begin
// Display header
//$display("Time\tclock\td\tqa[1]\tqb[0]");

// Monitor the signals and display them every time they change
//$monitor("%0d\t%b\t%b\t%b\t%b", $time, clock, d, qa[1], qa[0]);
#0 d=0;
clock=0;
#1000 $finish;
end
always
#8 d=~d;
endmodule
