`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 10xEngineers
// Engineer: Hafiz Talha Iqbal
// 
// Create Date:    11:36:36 06/23/2022 
// Design Name:     
// Module Name:    divider 
// Project Name:   ISP
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
module divider
#(parameter dividendBitWidth = 24, divisorBitWidth=16,
quotientBitWidth=dividendBitWidth-divisorBitWidth)
(input [dividendBitWidth-1:0] dvdnd,
input [divisorBitWidth-1:0] dvisor,
output [quotientBitWidth-1:0] q,
output [divisorBitWidth-1:0] r  
);
wire b_in [0:quotientBitWidth-1][0:divisorBitWidth-1];
wire b_out [0:quotientBitWidth-1][0:divisorBitWidth-1];
wire d [0:quotientBitWidth-1][0:divisorBitWidth-1];
wire sel [quotientBitWidth-1:0];
wire a [0:quotientBitWidth-1][0:divisorBitWidth-1];



wire a_index=dividendBitWidth-2;
genvar i,j;
generate
for (i=0;i<= quotientBitWidth-1 ; i= i+1)
     begin :row
     for (j=0; j<= divisorBitWidth-1; j= j+1)
          begin :column
          if (i==0 & j == 0) // top left block
			  begin
			  or OR(sel[quotientBitWidth-1-i],~b_out[i][j],dvdnd[dividendBitWidth-1]);
			  assign q[quotientBitWidth-1-i]=sel[quotientBitWidth-1-i];
			  SubtractorCell fc(dvdnd[dividendBitWidth-2],dvisor[divisorBitWidth-1-j],b_out[i][j+1],sel[quotientBitWidth-1-i],b_out[i][j],d[i][j]);
			  end
		  else
			  if ( j == 0 ) // blocks along the left edge
				  begin
				  if (i == quotientBitWidth-1)
				      begin
						or OR(sel[quotientBitWidth-1-i],~b_out[i][j],d[i-1][j]);
						assign q[quotientBitWidth-1-i]=sel[quotientBitWidth-1-i];
						SubtractorCell fc(d[i-1][1],dvisor[divisorBitWidth-1-j],b_out[i][j+1],sel[quotientBitWidth-1-i],b_out[i][j],r[divisorBitWidth-1-j]);
						end
				  else
				      begin // bottom left block
						or OR(sel[quotientBitWidth-1-i],~b_out[i][j],d[i-1][j]);
						assign q[quotientBitWidth-1-i]=sel[quotientBitWidth-1-i];
						SubtractorCell fc(d[i-1][1],dvisor[divisorBitWidth-1-j],b_out[i][j+1],sel[quotientBitWidth-1-i],b_out[i][j],d[i][j]);
						end			     
				  end
			  else
				  if( j == divisorBitWidth-1) // blocks along the right edge
					 begin
					 if (i == quotientBitWidth-1) // bottom right block
					     begin
						  SubtractorCell fc(dvdnd[quotientBitWidth-1-i],dvisor[divisorBitWidth-1-j],1'b0,sel[quotientBitWidth-1-i],b_out[i][j],r[0]);
					     end
					 else
					     begin // all other right edge blocks except the bottom right
						  SubtractorCell fc(dvdnd[quotientBitWidth-1-i],dvisor[divisorBitWidth-1-j],1'b0,sel[quotientBitWidth-1-i],b_out[i][j],d[i][j]);
						  end
					 end
				  else
					  if (i==0) // top row 
						  begin
						  SubtractorCell fc(dvdnd[dividendBitWidth-2-j],dvisor[divisorBitWidth-1-j],b_out[i][j+1],sel[quotientBitWidth-1-i],b_out[i][j],d[i][j]);
						  end
					  else
						  begin // blocks excluding the ones at top,left and right edge 
						  if (i ==quotientBitWidth-1)
						      begin  // bottom row excluding left and right end blocks 
								SubtractorCell fc(d[i-1][j+1],dvisor[divisorBitWidth-1-j],b_out[i][j+1],sel[quotientBitWidth-1-i],b_out[i][j],r[divisorBitWidth-1-j]);
								end
						  else
						      begin
								SubtractorCell fc(d[i-1][j+1],dvisor[divisorBitWidth-1-j],b_out[i][j+1],sel[quotientBitWidth-1-i],b_out[i][j],d[i][j]);
								end
						  end
				end
		end
endgenerate

endmodule
 
