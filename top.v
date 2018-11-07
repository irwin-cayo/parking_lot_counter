`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:08:36 03/13/2018 
// Design Name: 
// Module Name:    top 
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
module top(
		input wire clk, reset, 
		input wire a, b,   
		output wire [3:0] an, 
		output wire [7:0] sseg
    );
	 wire db1, db2; 
	 wire increment, decrement;
	 wire [7:0] counter; 
	 
	 debounce debounce1 (.sw(a), .db(db1), .clk(clk), .reset(reset));
	 debounce debounce2 (.sw(b), .db(db2), .clk(clk), .reset(reset));
	 fsm fsm_parking (.btn({db1,db2}), .clk(clk), .reset(reset), .enter(increment), .exit(decrement));
	 counter count (.enter(increment), .exit(decrement), .clk(clk), .reset(reset), .lot(counter));
	 hex_disp hd (.an(an), .sseg(sseg), .hex3(counter[7:4]), .hex2(counter[3:0]));

endmodule
