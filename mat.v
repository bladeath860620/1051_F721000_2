module mat (clock, reset, finish, switch, area, dot, row, col);
	input clock, reset, finish, switch;
	input [2:0] area;
	input [15:0] dot;
	output reg [7:0] row;
	output reg [15:0] col;

	reg [15:0] mine [7:0];
	integer cnt, tmp, t, i, j;

	initial begin
		row = 8'b11111111;
		col = 16'b0000000000000000;
		mine[0] = 16'b0000000000000000;
		mine[1] = 16'b0000000000000000;
		mine[2] = 16'b0000000000000000;
		mine[3] = 16'b0000000000000000;
		mine[4] = 16'b0000000000000000;
		mine[5] = 16'b0000000000000000;
		mine[6] = 16'b0000000000000000;
		mine[7] = 16'b0000000000000000;
		cnt = 0;
		tmp = 0;
	end

	always @(posedge clock) begin
		if (!reset) begin
			row = 8'b11111111;
			col = 16'b0000000000000000;
			mine[0] = 16'b0000000000000000;
			mine[1] = 16'b0000000000000000;
			mine[2] = 16'b0000000000000000;
			mine[3] = 16'b0000000000000000;
			mine[4] = 16'b0000000000000000;
			mine[5] = 16'b0000000000000000;
			mine[6] = 16'b0000000000000000;
			mine[7] = 16'b0000000000000000;
			cnt = 0;
			tmp = 0;
		end
		else if (finish) begin
		end
		else if (switch) begin
			t = 15;
			case (area)
				0:	begin
					for (i = 0; i <= 3; i = i + 1) begin
						for (j = 15; j >= 12; j = j - 1) begin
							mine[i][j] = mine[i][j] | dot[t];
							t = t - 1;
						end
					end
				end
				1:	begin
					for (i = 0; i <= 3; i = i + 1) begin
						for (j = 11; j >= 8; j = j - 1) begin
							mine[i][j] = mine[i][j] | dot[t];
							t = t - 1;
						end
					end
				end
				2:	begin
					for (i = 0; i <= 3; i = i + 1) begin
						for (j = 7; j >= 4; j = j - 1) begin
							mine[i][j] = mine[i][j] | dot[t];
							t = t - 1;
						end
					end
				end
				3:	begin
					for (i = 0; i <= 3; i = i + 1) begin
						for (j = 3; j >= 0; j = j - 1) begin
							mine[i][j] = mine[i][j] | dot[t];
							t = t - 1;
						end
					end
				end
				4:	begin
					for (i = 4; i <= 7; i = i + 1) begin
						for (j = 15; j >= 12; j = j - 1) begin
							mine[i][j] = mine[i][j] | dot[t];
							t = t - 1;
						end
					end
				end
				5:	begin
					for (i = 4; i <= 7; i = i + 1) begin
						for (j = 11; j >= 8; j = j - 1) begin
							mine[i][j] = mine[i][j] | dot[t];
							t = t - 1;
						end
					end
				end
				6:	begin
					for (i = 4; i <= 7; i = i + 1) begin
						for (j = 7; j >= 4; j = j - 1) begin
							mine[i][j] = mine[i][j] | dot[t];
							t = t - 1;
						end
					end
				end
				7:	begin
					for (i = 4; i <= 7; i = i + 1) begin
						for (j = 3; j >= 0; j = j - 1) begin
							mine[i][j] = mine[i][j] | dot[t];
							t = t - 1;
						end
					end
				end
				default:;
			endcase
		end

		if (cnt == 5000) begin
			row = 8'b11111111;
			row[tmp] = 0;
			case (tmp)
				0:	col = mine[0];
				1:	col = mine[1];
				2:	col = mine[2];
				3:	col = mine[3];
				4:	col = mine[4];
				5:	col = mine[5];
				6:	col = mine[6];
				7:	col = mine[7];
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
