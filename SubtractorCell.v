`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:20:45 06/23/2022 
// Design Name: 
// Module Name:    SubtractorCell 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SubtractorCell(
input a,b,b_in,sel,
output b_out,out
    );

wire d;
FS sub(a,b,b_in,d,b_out);

assign out = (sel & d) | (~sel & a );


endmodule
