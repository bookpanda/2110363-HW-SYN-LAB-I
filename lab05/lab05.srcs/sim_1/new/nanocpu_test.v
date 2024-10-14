`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 08:16:09 PM
// Design Name: 
// Module Name: nanocpu_test
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


module nanocpu_test();
    wire [31:0] p_address, d_data;
    wire [15:0] d_address;
    wire mem_wr;
    reg [31:0] p_data;
    reg clock, nreset;
    
    nanocpu CPU(p_address, p_data, d_address, mem_wr, d_data, clock, nreset);
    memory DATAMEM(d_data, d_address[15:0], mem_wr, clock);
    
    always
        #5 clock = ~clock;
    
    initial begin
        #0  clock=0; p_data = 0; nreset = 0;
        #10 nreset = 1; // opcode rs rt rd reserved
        #10 p_data = 32'b011000_00100_00101_00000_00000000000; // LW $r5, 0($r4) = 1
        #10 p_data = 32'b011000_00101_00100_00000_00000000000; // LW $r4, 0($r5) = 2
        #10 p_data = 32'b000001_00100_00101_00110_00000000000; // ADD $r6, $r5, $r4
        #10 p_data = 32'b000001_00100_00101_00110_00000000001; // SUB $r6, $r5, $r4
        #10 p_data = 32'b000001_00100_00101_00110_00000000010; // OR $r6, $r5, $r4
        #10 p_data = 32'b000001_00100_00101_00110_00000000011; // AND $r6, $r5, $r4
        #10 p_data = 32'b000001_00100_00101_00110_00000000100; // XOR $r6, $r5, $r4
        #10 p_data = 32'b000001_00100_00101_00110_00000000101; // -A $r6, $r5, $r4
        #10 p_data = 32'b000001_00100_00101_00110_00000000110; // NOT A $r6, $r5, $r4
        #10 p_data = 32'b000001_00100_00101_00110_00000000111; // NOT B $r6, $r5, $r4
        #10 $finish;
    end
    
endmodule