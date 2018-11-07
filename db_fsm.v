`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:06:16 03/13/2018 
// Design Name: 
// Module Name:    db_fsm 
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
module fsm(
	input wire clk, reset,
	input wire [1:0] btn,        //btn[0] = a          // btn[1] = b
	output reg enter, exit
    );
	 
	 // symbolic state declarations
	 localparam [3:0] s0 = 4'b0000,
							s1 = 4'b0001,
							s2 = 4'b0010,
							s3 = 4'b0011,
							s4 = 4'b0100,
							s5 = 4'b0101,
							s6 = 4'b0110,
							s7 = 4'b0111,
							s8 = 4'b1000; 
	
	//signal declaration
	reg [3:0] state_reg, state_next;
	
	//state register
	
	always @(posedge clk, posedge reset) 
		if (reset)
			state_reg <= s0;
		else
			state_reg <= state_next;

	//next-state logic
	always @*
	begin
		state_next = state_reg;    //default: same
		enter = 1'b0;              //default 0
		exit = 1'b0;               //default 0
		
			case (state_reg)
				s0: begin
					enter = 1'b0;
					exit = 1'b0;
						if (btn[0])
							if (btn[1])
								state_next = state_reg;
							else 
								state_next = s1;
						else 
						if (btn[1])
								state_next = s5;
							else 
								state_next = state_reg;
					  end
				s1: begin
						enter = 0;
						exit = 0;
						if (btn[0])
							if (btn[1])
								state_next = s2;
							else
								state_next = state_reg;
						else
						if (btn[1] == 0)
							state_next = s0;
						  end
				s2: begin
						enter = 0;
						exit = 0;
						if (btn[0] == 0)
							if (btn[1])
								state_next = s3;
						 end
				s3: begin
						enter = 0;
						exit = 0;
						if (btn[0] == 0)
							if (btn[1] == 0)
								state_next = s4;
						 end
				s4: begin
						enter = 1;
						exit = 0;
						state_next = s0;
						 end
				s5: begin
						enter = 0;
						exit = 0;
						if (btn[0])
							if(btn[1])
								state_next = s6;
						else
						if (btn[1] == 0)
							state_next= s0;
						 end
				s6: begin
						enter = 0;
						exit = 0;
						if (btn[0])
							if(btn[1] == 0)
								state_next = s7;
						 end
				s7: begin
						enter = 0;	
						exit = 0;
						if (btn[0] == 0)
							if (btn[1] == 0)
								state_next = s8;
						 end
				s8: begin
						enter = 0;
						exit = 1;
						state_next = s0;
						 end
					endcase
				end
endmodule
