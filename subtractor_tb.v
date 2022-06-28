`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:50:43 06/24/2022
// Design Name:   SubtractorCell
// Module Name:   C:/Users/user3/Downloads/Documents/divider_custom/subtractor_tb.v
// Project Name:  divider_custom
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SubtractorCell
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module subtractor_tb;

	// Inputs
	reg a;
	reg b;
	reg b_in;
	reg sel;

	// Outputs
	wire b_out;
	wire out;

	// Instantiate the Unit Under Test (UUT)
	SubtractorCell uut (
		.a(a), 
		.b(b), 
		.b_in(b_in), 
		.sel(sel), 
		.b_out(b_out), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 1;
		b = 0;
		b_in = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
      a = 1;
		b = 1;
		b_in = 0;
		sel = 0;
		
		#100;
      a = 1;
		b = 1;
		b_in = 1;
		sel = 1;
  
		// Add stimulus here

	end
      
endmodule


