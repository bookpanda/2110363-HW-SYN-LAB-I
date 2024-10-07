`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 12:24:27 PM
// Design Name: 
// Module Name: queue
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


module queue(
    output reg [7:0] dout,
    output reg [6:0] st,
    output reg [6:0] ed,
    input [7:0] din,
    input we, oe, clk
    );
    
    reg [7:0] mem [127:0];
    
    initial begin
        st = 0;
        ed = 0;
    end
    
    always @(posedge clk) begin
        dout = 8'b0;
        if(we && (ed+1)%128 >= st) begin
            mem[ed] = din;
            ed = (ed+1)%128;
        end
        if(oe && (st+1)%128 < ed) begin
            dout = mem[st];
            st = (st+1)%128;
        end
    end
    
endmodule
