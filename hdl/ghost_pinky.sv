module ghost_pinky (
    input Reset,
    input frame_clk,
    output [9:0] PosX, PosY, //change to output ports after mid-project demo
    input [4:0] counter,
    input game_over,
    input start_game
);

logic [9:0] Ghost_X_Pos, Ghost_X_Motion, Ghost_Y_Pos, Ghost_Y_Motion, Ghost_Size, Ghost_X_Pos_next, Ghost_Y_Pos_next, Ghost_X_Motion_next, Ghost_Y_Motion_next;
	 
parameter [9:0] Ghost_X_Center= 10'd315;  // Center position on the X axis
parameter [9:0] Ghost_Y_Center= 10'd249;  // Center position on the Y axis
parameter [9:0] Ghost_X_Min=6;       // Leftmost point on the X axis
parameter [9:0] Ghost_X_Max=598;     // Rightmost point on the X axis
parameter [9:0] Ghost_Y_Min=56;       // Topmost point on the Y axis
parameter [9:0] Ghost_Y_Max=452;     // Bottommost point on the Y axis
parameter [9:0] Ghost_X_Step=1;      // Step size on the X axis
parameter [9:0] Ghost_Y_Step=1;      // Step size on the Y axis

logic [8:0] maze_array_addr;
logic [0:639] maze_array_data;
logic [8:0] maze_array_addr_upper;
logic [0:639] maze_array_data_upper;
logic [8:0] maze_array_addr_lower;
logic [0:639] maze_array_data_lower;

logic [9:0] Ghost_X_Pos_minus2, Ghost_X_Pos_minus2_next;
logic [9:0] Ghost_X_Pos_plus18, Ghost_X_Pos_plus18_next;

logic [1:0] direction, direction_next, counter_value, counter_XOR, counter_XOR_next, direction_last; //0 - A, 1 - D, 2 - S, 3 - W

logic check_space_left, check_space_right, check_space_up, check_space_down;

assign check_space_left = (maze_array_data[Ghost_X_Pos_minus2] == 1'b0);
assign check_space_right = (maze_array_data[Ghost_X_Pos_plus18] == 1'b0);
assign check_space_up = (maze_array_data_upper[Ghost_X_Pos] == 1'b0);
assign check_space_down = (maze_array_data_lower[Ghost_X_Pos] == 1'b0);
assign counter_value = counter[1:0] ^ counter_XOR;

assign maze_array_addr = Ghost_Y_Pos[8:0];
assign maze_array_addr_upper = (Ghost_Y_Pos[8:0] + -9'd2);
assign maze_array_addr_lower = (Ghost_Y_Pos[8:0] + 9'd18);

maze_array_rom maze_array_rom (
    .addr(maze_array_addr),
    .data(maze_array_data)
);

maze_array_rom maze_array_rom_upper (
    .addr(maze_array_addr_upper),
    .data(maze_array_data_upper)
);

maze_array_rom maze_array_rom_lower (
    .addr(maze_array_addr_lower),
    .data(maze_array_data_lower)
);

always_ff @(posedge Reset or posedge frame_clk) begin
    if (Reset) begin
        Ghost_Y_Motion <= 10'd0; //Ghost_Y_Step;
		Ghost_X_Motion <= 10'd0; //Ghost_X_Step;
		Ghost_Y_Pos <= Ghost_Y_Center;
		Ghost_X_Pos <= Ghost_X_Center;
        direction <= 2'b01;
        direction_last <= 0;
        Ghost_X_Pos_minus2 <= 0;
        Ghost_X_Pos_plus18 <= 0;
        counter_XOR <= 0;
    end
    else begin
        if (game_over || !start_game) begin
            Ghost_Y_Motion <= '0; //Ghost_Y_Step;
            Ghost_X_Motion <= 1; //Ghost_X_Step;
            Ghost_Y_Pos <= Ghost_Y_Pos;
            Ghost_X_Pos <= Ghost_X_Pos;
            direction <= direction_next;
            direction_last <= direction;
            Ghost_X_Pos_minus2 <= Ghost_X_Pos_minus2_next;
            Ghost_X_Pos_plus18 <= Ghost_X_Pos_plus18_next;
            counter_XOR = counter_XOR_next;
        end
        else begin
           Ghost_Y_Motion <= Ghost_Y_Motion_next; //Ghost_Y_Step;
            Ghost_X_Motion <= Ghost_X_Motion_next; //Ghost_X_Step;
            Ghost_Y_Pos <= Ghost_Y_Pos_next;
            Ghost_X_Pos <= Ghost_X_Pos_next;
            direction <= direction_next;
            direction_last <= direction;
            Ghost_X_Pos_minus2 <= Ghost_X_Pos_minus2_next;
            Ghost_X_Pos_plus18 <= Ghost_X_Pos_plus18_next;
            counter_XOR = counter_XOR_next; 
        end
    end
end

always_comb begin : Motion
    Ghost_X_Pos_next = Ghost_X_Pos;
    Ghost_Y_Pos_next = Ghost_Y_Pos;
    Ghost_X_Motion_next = Ghost_X_Motion;
    Ghost_Y_Motion_next = Ghost_Y_Motion;
    direction_next = direction; //0 - A, 1 - D, 2 - S, 3 - W
    counter_XOR_next = counter_XOR;

    if (direction == 2'b00) begin
        Ghost_X_Pos_minus2_next = Ghost_X_Pos + -10'd3;
        Ghost_X_Pos_plus18_next = Ghost_X_Pos + 10'd18; //does not really matter
    end 
    else if (direction == 2'b01) begin
        Ghost_X_Pos_minus2_next = Ghost_X_Pos + -10'd2; //does not really matter
        Ghost_X_Pos_plus18_next = Ghost_X_Pos + 10'd18;
    
    end
    else begin
        Ghost_X_Pos_minus2_next = Ghost_X_Pos + -10'd2;
        Ghost_X_Pos_plus18_next = Ghost_X_Pos + 10'd18;
    end

    if (!check_space_right && direction == 2'b01) begin
        if (check_space_up) begin
            Ghost_Y_Motion_next = -1;
            Ghost_X_Motion_next = 0;
            direction_next = 2'b11;
        end
        else if (check_space_down) begin
            Ghost_Y_Motion_next = 1;
            Ghost_X_Motion_next = 0;
            direction_next = 2'b10;
        end
        else begin
            Ghost_X_Motion_next = -1;
            Ghost_Y_Motion_next = 0;
            direction_next = 2'b00;
        end
    end
    else if (!check_space_up && direction == 2'b11) begin
        if (check_space_left) begin
            Ghost_X_Motion_next = -1;
            Ghost_Y_Motion_next = 0;
            direction_next = 2'b00;
        end
        else if (check_space_right) begin
            Ghost_X_Motion_next = 1;
            Ghost_Y_Motion_next = 0;
            direction_next = 2'b01;
        end
        else begin
            Ghost_Y_Motion_next = 1;
            Ghost_X_Motion_next = 0;
            direction_next = 2'b10;
        end
    end
    else if (!check_space_down && direction == 2'b10) begin
        if (check_space_right) begin
            Ghost_X_Motion_next = 1;
            Ghost_Y_Motion_next = 0;
            direction_next = 2'b01;
        end
        else if (check_space_left) begin
            Ghost_X_Motion_next = -1;
            Ghost_Y_Motion_next = 0;
            direction_next = 2'b00;
        end
        else begin
            Ghost_Y_Motion_next = -1;
            Ghost_X_Motion_next = 0;
            direction_next = 2'b11;
        end
	 end
    else if (!check_space_left && direction == 2'b00) begin
        if (check_space_up) begin
            Ghost_Y_Motion_next = -1;
            Ghost_X_Motion_next = 0;
            direction_next = 2'b11;
        end
        else if (check_space_down)begin
            Ghost_Y_Motion_next = 1;
            Ghost_X_Motion_next = 0;
            direction_next = 2'b10;
        end
        else begin
            Ghost_X_Motion_next = 1;
            Ghost_Y_Motion_next = 0;
            direction_next = 2'b01;
        end
    end 

    Ghost_Y_Pos_next = Ghost_Y_Pos + Ghost_Y_Motion_next;
    Ghost_X_Pos_next = Ghost_X_Pos + Ghost_X_Motion_next;
end

assign PosX = Ghost_X_Pos;
assign PosY = Ghost_Y_Pos;

endmodule