module button (switch, reset, button4, pos);
	input switch, reset;
	input [3:0] button4;
	output reg [2:0] pos;

	initial begin
		pos = 3'b000;
	end

	always @(*) begin
		if (reset) begin
			if (switch) begin
				case (button4)
					4'b0111: begin
						if (pos <= 3'b011) begin
							pos = pos + 3'b100;
						end
						else begin
						end
					end
					4'b1011: begin
						if (pos >= 3'b100) begin
							pos = pos - 3'b100;
						end
						else begin
						end
					end
					4'b1101: begin
						if ((pos != 3'b000) && (pos != 3'b100)) begin
							pos = pos - 3'b001;
						end
						else begin
						end
					end
					4'b1110: begin
						if ((pos != 3'b011) && (pos != 3'b111)) begin
							pos = pos + 3'b001;
						end
						else begin
						end
					end
					default:;
				endcase
			end
			else begin
			end
		end
		else begin
			pos = 3'b000;
		end
	end
endmodule
