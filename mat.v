module mat (clock, reset, finish, switch, area, dot, row, col, map0, map1, map2, map3, map4, map5, map6, map7, before0, before1, before2, before3, before4, before5, before6, before7, after0, after1, after2, after3, after4, after5, after6, after7, result);

	input index, clock, reset, finish, switch;
	input [15:0] map0, map1, map2, map3, map4, map5, map6, map7;
	input [15:0] before0, before1, before2, before3, before4, before5, before6, before7;
	input [2:0] area;
	input [15:0] dot;
	output reg [7:0] row;
	output reg [15:0] col;
	output reg result;
	output reg [15:0] after0, after1, after2, after3, after4, after5, after6, after7;

	reg [15:0] pressed [7:0];
	reg [15:0] map [7:0];

	integer cnt, tmp, t, i, j;

	initial begin
		row = 8'b11111111;
		col = 16'b0000000000000000;
		pressed[0] = 16'b0000000000000000;
		pressed[1] = 16'b0000000000000000;
		pressed[2] = 16'b0000000000000000;
		pressed[3] = 16'b0000000000000000;
		pressed[4] = 16'b0000000000000000;
		pressed[5] = 16'b0000000000000000;
		pressed[6] = 16'b0000000000000000;
		pressed[7] = 16'b0000000000000000;
		map[0] = map0;
		map[1] = map1;
		map[2] = map2;
		map[3] = map3;
		map[4] = map4;
		map[5] = map5;
		map[6] = map6;
		map[7] = map7;
		cnt = 0;
		tmp = 0;
		result = 0;
	end

	always @(posedge clock) begin
		if (!reset) begin
			row = 8'b11111111;
			col = 16'b0000000000000000;
			pressed[0] = 16'b0000000000000000;
			pressed[1] = 16'b0000000000000000;
			pressed[2] = 16'b0000000000000000;
			pressed[3] = 16'b0000000000000000;
			pressed[4] = 16'b0000000000000000;
			pressed[5] = 16'b0000000000000000;
			pressed[6] = 16'b0000000000000000;
			pressed[7] = 16'b0000000000000000;
			map[0] = map0;
			map[1] = map1;
			map[2] = map2;
			map[3] = map3;
			map[4] = map4;
			map[5] = map5;
			map[6] = map6;
			map[7] = map7;
			cnt = 0;
			tmp = 0;
			result = 0;
		end
		else if (finish | result) begin
			//game over
		end
		else if (switch) begin
			begin
				pressed[0] = before0;
				pressed[1] = before1;
				pressed[2] = before2;
				pressed[3] = before3;
				pressed[4] = before4;
				pressed[5] = before5;
				pressed[6] = before6;
				pressed[7] = before7;
			end
			t = 15;
			case (area)
				0:	begin
					for (i = 0; i <= 3; i = i + 1) begin
						for (j = 15; j >= 12; j = j - 1) begin
							pressed[i][j] = pressed[i][j] | dot[t];
							t = t - 1;
							if(pressed[i][j] & map[i][j] == 1)
								result = 1;
						end
					end
				end
				1:	begin
					for (i = 0; i <= 3; i = i + 1) begin
						for (j = 11; j >= 8; j = j - 1) begin
							pressed[i][j] = pressed[i][j] | dot[t];
							t = t - 1;
							if(pressed[i][j] & map[i][j] == 1)
								result = 1;
						end
					end
				end
				2:	begin
					for (i = 0; i <= 3; i = i + 1) begin
						for (j = 7; j >= 4; j = j - 1) begin
							pressed[i][j] = pressed[i][j] | dot[t];
							t = t - 1;
							if(pressed[i][j] & map[i][j] == 1)
								result = 1;
						end
					end
				end
				3:	begin
					for (i = 0; i <= 3; i = i + 1) begin
						for (j = 3; j >= 0; j = j - 1) begin
							pressed[i][j] = pressed[i][j] | dot[t];
							t = t - 1;
							if(pressed[i][j] & map[i][j] == 1)
								result = 1;
						end
					end
				end
				4:	begin
					for (i = 4; i <= 7; i = i + 1) begin
						for (j = 15; j >= 12; j = j - 1) begin
							pressed[i][j] = pressed[i][j] | dot[t];
							t = t - 1;
							if(pressed[i][j] & map[i][j] == 1)
								result = 1;
						end
					end
				end
				5:	begin
					for (i = 4; i <= 7; i = i + 1) begin
						for (j = 11; j >= 8; j = j - 1) begin
							pressed[i][j] = pressed[i][j] | dot[t];
							t = t - 1;
							if(pressed[i][j] & map[i][j] == 1)
								result = 1;
						end
					end
				end
				6:	begin
					for (i = 4; i <= 7; i = i + 1) begin
						for (j = 7; j >= 4; j = j - 1) begin
							pressed[i][j] = pressed[i][j] | dot[t];
							t = t - 1;
							if(pressed[i][j] & map[i][j] == 1)
								result = 1;
						end
					end
				end
				7:	begin
					for (i = 4; i <= 7; i = i + 1) begin
						for (j = 3; j >= 0; j = j - 1) begin
							pressed[i][j] = pressed[i][j] | dot[t];
							t = t - 1;
							if(pressed[i][j] & map[i][j] == 1)
								result = 1;
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
				0:	col = pressed[0];
				1:	col = pressed[1];
				2:	col = pressed[2];
				3:	col = pressed[3];
				4:	col = pressed[4];
				5:	col = pressed[5];
				6:	col = pressed[6];
				7:	col = pressed[7];
				default:;
			endcase
			if (tmp == 7) begin
				tmp = 0;
			end
			else begin
				tmp = tmp + 1;
			end
			cnt = 0;
			after0 = pressed[0];
			after1 = pressed[1];
			after2 = pressed[2];
			after3 = pressed[3];
			after4 = pressed[4];
			after5 = pressed[5];
			after6 = pressed[6];
			after7 = pressed[7];
		end
		else begin
			cnt = cnt + 1;
		end
	end



endmodule
