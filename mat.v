module mat (clock, m0, m1, m2, m3, m4, m5, m6, m7, row, col);
	input clock;
	input [7:0] m0, m1, m2, m3, m4, m5, m6, m7;
	output reg [7:0] row;
	output reg [7:0] col;

	integer cnt, tmp;

	initial begin
		row = 8'b11111111;
		col = 8'b00000000;
		cnt = 0;
		tmp = 0;
	end

	always @(posedge clock) begin
		row = 8'b11111111;
		row[tmp] = 0;
		if (cnt == 5000) begin
			case (tmp)
				0:	col = m0;
				1:	col = m1;
				2:	col = m2;
				3:	col = m3;
				4:	col = m4;
				5:	col = m5;
				6:	col = m6;
				7:	col = m7;
				default:;
			endcase
			if (tmp == 7) begin
				tmp = 0;
			end
			else begin
				tmp = tmp + 1;
			end
			cnt = 0;
		end
		else begin
			cnt = cnt + 1;
		end
	end
endmodule
