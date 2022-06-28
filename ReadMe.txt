

-->The folder contains the circuit diagram of the divider, named as 'divider circuit.jpeg'
In order to understand the code, you need to look at the circuit first.

-->Normally 2n/n dividers are implemented where 2n is the bitwidth of the dividend and n 
is the bitwidth of the divider.

-->Number of Quotient bits = Dividend BitWidth - Divisor BitWidth

-->Bit width of the dividend and the divisor can be changed by the parameters of the file
divider.v 

-->If the Number of quotient bitwidth is enough hold the quotient of the division, the 
answer produced by the hardware will be correct. 

-->In our case, the above condition is true So the divider works fine.

-->The circuit contains an array of the same blocks, the only difference is in the connections.
Based on the locality, different conditions are used in the code to instantiate the blocks.

-->gradients.txt file contains grad_hs grad_vs scaled_hs and scaled_vs ( refer to the 
document CFA_Filter v0.3) for the whole image, the testbench performs the calculations
on grad_hs and grad_vs and produces scaled_hs.

-->To run the simulation for 24/16 divider, select the relevant test bench file
"divider_tb24by16" and run behavioral simulation.

-->Once the waveform window opens, you can open 'config24by16.wcfg' wave cofiguration file to 
observe the results. 

  
