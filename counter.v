`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:07:40 03/13/2018 
// Design Name: 
// Module Name:    counter 
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
module counter(
   input wire clk, reset,
   input wire enter, exit,
   output reg [7:0] lot
  );

reg [7:0] count = 8'b00010100;
	
	always@(posedge clk, posedge reset) 
	begin
		if (reset)
	        count <= 8'b00010100;
        else if (enter)		
            count <= count + 1'b1;		
        else if (exit)			
            count <= count - 1'b1;
    end

    always @* 
    begin	
	    lot = count;
    end

endmodule
