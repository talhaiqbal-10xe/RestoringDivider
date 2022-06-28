`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:05:15 06/28/2022
// Design Name:   divider
// Module Name:   C:/Users/user3/Downloads/Documents/divider_custom/divider_tb24by16.v
// Project Name:  divider_custom
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module divider_tb24by16;

	// Inputs
	reg [23:0] dvdnd;
	reg [15:0] dvisor;

	// Outputs
	wire [7:0] q;
	wire [15:0] r;

	// Instantiate the Unit Under Test (UUT)
	divider uut (
		.dvdnd(dvdnd), 
		.dvisor(dvisor), 
		.q(q), 
		.r(r)
	);

	wire t;
	reg [15:0] gradh1,gradv1,gradh,gradv;
	
   assign t = gradh==q ;
   integer outfile0;

	initial 
	         begin 
	         outfile0=$fopen("gradients.txt","r");
		      while (! $feof(outfile0))//read until an "end of file" is reached. 
						begin 
						$fscanf(outfile0,"%d %d %d %d\n",gradh1,gradv1,gradh,gradv); //scan each line and get the value as a decimal.
						dvdnd = gradh1*256;
						dvisor = gradh1+gradv1;
						#50; //wait some time as needed.
						end 
				//once reading and writing is finished, close the file.
				$fclose(outfile0);
				end 
		        
endmodule
