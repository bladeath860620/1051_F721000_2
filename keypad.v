module keypad (clock, reset, finish, switch, keycol, keyrow, dot);
	input clock, reset, finish, switch;
	input [3:0] keycol;
	output reg [3:0] keyrow;
	output reg [15:0] dot;

	reg [7:0] pre;

	initial begin
		keyrow = 4'b0111;
		dot = 16'b0000000000000000;
		pre = 8'b11111111;
	end

	always @(posedge clock) begin
		if (!reset) begin
			dot = 16'b0000000000000000;
			pre  = 8'b11111111;
		end
		else if (finish) begin
		end
		else if (switch) begin
			dot = 16'b0000000000000000;
			if ({keyrow, keycol} != pre) begin
				case ({keyrow, keycol})
					8'b11100111:	dot[15] = 1; // 0
					8'b11101011:	dot[11] = 1; // 1
					8'b11011011:	dot[10] = 1; // 2
					8'b10111011:	dot[9]  = 1; // 3
					8'b11101101:	dot[7]  = 1; // 4
					8'b11011101:	dot[6]  = 1; // 5
					8'b10111101:	dot[5]  = 1; // 6
					8'b11101110:	dot[3]  = 1; // 7
					8'b11011110:	dot[2]  = 1; // 8
					8'b10111110:	dot[1]  = 1; // 9
					8'b11010111:	dot[14] = 1; // A
					8'b10110111:	dot[13] = 1; // B
					8'b01111110:	dot[0]  = 1; // C
					8'b01111101:	dot[4]  = 1; // D
					8'b01111011:	dot[8]  = 1; // E
					8'b01110111:	dot[12] = 1; // F
					default:;
				endcase
			end
			else begin
			end
			case (keyrow)
				4'b0111:	keyrow = 4'b1011;
				4'b1011:	keyrow = 4'b1101;
				4'b1101:	keyrow = 4'b1110;
				4'b1110:	keyrow = 4'b0111;
				default:;
			endcase
			pre = {keyrow, keycol};
		end
		else begin
		end
	end
endmodule
