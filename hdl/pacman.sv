module pacman (
    input Reset,
    input frame_clk,
    input [7:0] keycode,
    output [9:0] PacmanX, PacmanY,
    output test, test_minus2, test_plus18, test_plus4, test_plus8, test_plus12, 
    output [1:0] direction,
    output [9:0] Pacman_X_Motion, Pacman_Y_Motion, 
    output pacman_type,
    output [4:0] counter,
    input [9:0] clydeX, clydeY, inkyX, inkyY, blinkyX, blinkyY, pinkyX, pinkyY,
    output game_over,
    input [7:0] keycode_enter, 
    output start_game
);

logic [9:0] Pacman_X_Pos, Pacman_Y_Pos, Pacman_Size, Pacman_X_Pos_next, Pacman_Y_Pos_next, Pacman_X_Motion_next, Pacman_Y_Motion_next; //removed Pacman_Y_Motion and Pacman_X_Motion
logic pacman_type_next;
logic [4:0] counter_next;
	 
parameter [9:0] Pacman_X_Center=51;  // Center position on the X axis
parameter [9:0] Pacman_Y_Center=65;  // Center position on the Y axis
parameter [9:0] Pacman_X_Min=6;       // Leftmost point on the X axis
parameter [9:0] Pacman_X_Max=598;     // Rightmost point on the X axis
parameter [9:0] Pacman_Y_Min=56;       // Topmost point on the Y axis
parameter [9:0] Pacman_Y_Max=452;     // Bottommost point on the Y axis
parameter [9:0] Pacman_X_Step=1;      // Step size on the X axis
parameter [9:0] Pacman_Y_Step=1;      // Step size on the Y axis

logic [8:0] maze_array_addr;
logic [0:639] maze_array_data;
logic [8:0] maze_array_addr_upper;
logic [0:639] maze_array_data_upper;
logic [8:0] maze_array_addr_lower;
logic [0:639] maze_array_data_lower;
logic [8:0] maze_array_addr_plus4;
logic [0:639] maze_array_data_plus4;
logic [8:0] maze_array_addr_plus8;
logic [0:639] maze_array_data_plus8;
logic [8:0] maze_array_addr_plus12;
logic [0:639] maze_array_data_plus12;
logic [8:0] maze_array_addr_plus16;
logic [0:639] maze_array_data_plus16;

logic [9:0] Pacman_X_Pos_minus2, Pacman_X_Pos_minus2_next;
logic [9:0] Pacman_X_Pos_plus18, Pacman_X_Pos_plus18_next;

logic [1:0] direction_next; //0 - A, 1 - D, 2 - S, 3 - W
logic start_game_next;

assign Pacman_Size = 8;
assign maze_array_addr = Pacman_Y_Pos[8:0];
assign maze_array_addr_upper = (Pacman_Y_Pos[8:0] + -9'd2);
assign maze_array_addr_lower = (Pacman_Y_Pos[8:0] + 9'd18);
assign maze_array_addr_plus4 = (Pacman_Y_Pos[8:0] + 9'd4);
assign maze_array_addr_plus8 = (Pacman_Y_Pos[8:0] + 9'd8);
assign maze_array_addr_plus12 = (Pacman_Y_Pos[8:0] + 9'd12);
assign maze_array_addr_plus16 = (Pacman_Y_Pos[8:0] + 9'd16); 

maze_array_rom maze_array_rom (
    .addr(maze_array_addr),
    .data(maze_array_data)
);

maze_array_rom maze_array_rom4 (
    .addr(maze_array_addr_plus4),
    .data(maze_array_data_plus4)
);

maze_array_rom maze_array_rom8 (
    .addr(maze_array_addr_plus8),
    .data(maze_array_data_plus8)
);

maze_array_rom maze_array_rom12 (
    .addr(maze_array_addr_plus12),
    .data(maze_array_data_plus12)
);

maze_array_rom maze_array_rom16 (
    .addr(maze_array_addr_plus16),
    .data(maze_array_data_plus16)
);

maze_array_rom maze_array_rom_upper (
    .addr(maze_array_addr_upper),
    .data(maze_array_data_upper)
);

maze_array_rom maze_array_rom_lower (
    .addr(maze_array_addr_lower),
    .data(maze_array_data_lower)
);

always_ff @( posedge Reset or posedge frame_clk ) begin : Move_Pacman
    if (Reset) begin
        Pacman_Y_Motion <= 10'd0; //Pacman_Y_Step;
		Pacman_X_Motion <= 10'd0; //Pacman_X_Step;
		Pacman_Y_Pos <= Pacman_Y_Center;
		Pacman_X_Pos <= Pacman_X_Center;
        Pacman_X_Pos_minus2 <= 0;
        Pacman_X_Pos_plus18 <= 0;
        pacman_type <= 0;
        counter <= 0;
        direction <= 0;
        test <= '0;
        test_minus2 <= '0;
        test_plus18 <= '0;
        game_over <= 0;
        start_game <= 0;
    end
    else begin
        if ((((Pacman_X_Pos - clydeX) <= 16 || (clydeX - Pacman_X_Pos) <= 16) && ((Pacman_Y_Pos - clydeY) <= 16 || (clydeY - Pacman_Y_Pos) <= 16)) 
            || (((Pacman_X_Pos - inkyX) <= 16 || (inkyX - Pacman_X_Pos) <= 16) && ((Pacman_Y_Pos - inkyY) <= 16 && (inkyY - Pacman_Y_Pos) <= 16))
            || (((Pacman_X_Pos - blinkyX) <= 16 || (blinkyX - Pacman_X_Pos) <= 16) && ((Pacman_Y_Pos - blinkyY) <= 16 && (blinkyY - Pacman_Y_Pos) <= 16))
            || (((Pacman_X_Pos - pinkyX) <= 16 || (pinkyX - Pacman_X_Pos) <= 16) && ((Pacman_Y_Pos - pinkyY) <= 16 && (pinkyY - Pacman_Y_Pos) <= 16))) begin 
                game_over <= 1'b1;
                Pacman_Y_Pos <= Pacman_Y_Pos;  // Update Pacman position
                Pacman_X_Pos <= Pacman_X_Pos;
                Pacman_X_Motion <= '0;
                Pacman_Y_Motion <= '0;
                direction <= direction_next;
                Pacman_X_Pos_minus2 <= Pacman_X_Pos_minus2_next;
                Pacman_X_Pos_plus18 <= Pacman_X_Pos_plus18_next;
            end
        else begin
            game_over <= 1'b0;
            Pacman_Y_Pos <= Pacman_Y_Pos_next;  // Update Pacman position
            Pacman_X_Pos <= Pacman_X_Pos_next;
            Pacman_X_Motion <= Pacman_X_Motion_next;
            Pacman_Y_Motion <= Pacman_Y_Motion_next;
            direction <= direction_next;
            Pacman_X_Pos_minus2 <= Pacman_X_Pos_minus2_next;
            Pacman_X_Pos_plus18 <= Pacman_X_Pos_plus18_next;
        end

        start_game <= start_game_next;

        test_minus2 <= maze_array_data[Pacman_X_Pos_minus2];
        test <= maze_array_data[Pacman_X_Pos];
        test_plus18 <= maze_array_data[Pacman_X_Pos_plus18];
        test_plus4 <= maze_array_data_plus4[Pacman_X_Pos_plus18];
        test_plus8 <= maze_array_data_plus8[Pacman_X_Pos_plus18];
        test_plus12 <= maze_array_data_plus12[Pacman_X_Pos_plus18];

        counter <= counter_next;
        if (counter == 5'b11111) pacman_type <= pacman_type_next;
        else pacman_type <= pacman_type;
    end
end

always_comb begin : start_game_comb
    start_game_next = start_game;
    if (keycode == keycode_enter)
        start_game_next = 1'b1;
end

always_comb begin
    counter_next = counter + 1;
    pacman_type_next = ~pacman_type;

    Pacman_X_Pos_next = Pacman_X_Pos;
    Pacman_Y_Pos_next = Pacman_Y_Pos;
    Pacman_X_Motion_next = Pacman_X_Motion;
    Pacman_Y_Motion_next = Pacman_Y_Motion;
    direction_next = direction;

    if (direction == 2'b00) begin
        Pacman_X_Pos_minus2_next = Pacman_X_Pos + -10'd3;
        Pacman_X_Pos_plus18_next = Pacman_X_Pos + 10'd18; //does not really matter
    end 
    else if (direction == 2'b01) begin
        Pacman_X_Pos_minus2_next = Pacman_X_Pos + -10'd2; //does not really matter
        Pacman_X_Pos_plus18_next = Pacman_X_Pos + 10'd19;
    
    end
    else begin
        Pacman_X_Pos_minus2_next = Pacman_X_Pos + -10'd2;
        Pacman_X_Pos_plus18_next = Pacman_X_Pos + 10'd18;
    end
    

    case (keycode)
        8'h04 : begin //A
                    //look for places where pacman cannot move from
                    if ((maze_array_data[Pacman_X_Pos_minus2] == 1'b1)) begin
                        Pacman_Y_Motion_next = Pacman_Y_Motion;
                        Pacman_X_Motion_next = 0;
                    end
                    else begin
                        Pacman_X_Motion_next = -1;
                        Pacman_Y_Motion_next = 0;
                        direction_next = 2'b00;
                    end
                end
                
        8'h07 : begin //D
                    if ((maze_array_data[Pacman_X_Pos_plus18] == 1'b1)) begin
                        Pacman_Y_Motion_next = Pacman_Y_Motion;
                        Pacman_X_Motion_next = 0;
                        // direction <= 2'b01;
                    end
                    else begin
                        Pacman_X_Motion_next = 1;
                        Pacman_Y_Motion_next = 0;
                        direction_next = 2'b01;
                    end 
                end

                    
        8'h16 : begin //S
                    if ((maze_array_data_lower[Pacman_X_Pos] == 1'b1)) begin
                        Pacman_Y_Motion_next = 0;
                        Pacman_X_Motion_next = Pacman_X_Motion;
                    end
                    else begin
                        Pacman_Y_Motion_next = 1;
                        Pacman_X_Motion_next = 0;
                        direction_next = 2'b10;
                    end
                end
                    
        8'h1A : begin //W
                    //look for places where pacman cannot move from
                    if ((maze_array_data_upper[Pacman_X_Pos] == 1'b1)) begin
                        Pacman_Y_Motion_next = 0;
                        Pacman_X_Motion_next = Pacman_X_Motion;
                    end
                    else begin
                        Pacman_Y_Motion_next = -1;
                        Pacman_X_Motion_next = 0;
                        direction_next = 2'b11;
                    end
                end	  
        default: begin
            if ((maze_array_data[Pacman_X_Pos_minus2] == 1'b1) && direction == 2'b00)  //A - Pacman cannot go more left 
                Pacman_X_Motion_next = '0;  
        
            else if ((maze_array_data[Pacman_X_Pos_plus18] == 1'b1) && direction == 2'b01)  //D - Pacman cannot go more right
                Pacman_X_Motion_next = '0;
                
            else if ((maze_array_data_lower[Pacman_X_Pos] == 1'b1) && direction == 2'b10)  //S -Pacman cannot go more below
                Pacman_Y_Motion_next = '0;  
                
            else if ((maze_array_data_upper[Pacman_X_Pos] == 1'b1) && direction == 2'b11)  //W- Pacman cannot go more up
                Pacman_Y_Motion_next = '0;
			end
    endcase

    Pacman_Y_Pos_next = Pacman_Y_Pos + Pacman_Y_Motion_next;
    Pacman_X_Pos_next = Pacman_X_Pos + Pacman_X_Motion_next;
end

assign PacmanX = Pacman_X_Pos;
assign PacmanY = Pacman_Y_Pos;

endmodule

/*
if (direction == 2'b00) begin
            Pacman_X_Pos_minus2 <= Pacman_X_Pos + -10'd3;
            Pacman_X_Pos_plus18 <= Pacman_X_Pos + 10'd18; //does not really matter
        end 
        else if (direction == 2'b01) begin
            Pacman_X_Pos_minus2 <= Pacman_X_Pos + -10'd2; //does not really matter
            Pacman_X_Pos_plus18 <= Pacman_X_Pos + 10'd19;
        
        end
        else begin
            Pacman_X_Pos_minus2 <= Pacman_X_Pos + -10'd2;
            Pacman_X_Pos_plus18 <= Pacman_X_Pos + 10'd18;
        end
        

        case (keycode)
            8'h04 : begin //A
                        //look for places where pacman cannot move from
                        if ((maze_array_data[Pacman_X_Pos_minus2] == 1'b1) || (maze_array_data_plus4[Pacman_X_Pos_minus2] == 1'b1)
                        || (maze_array_data_plus8[Pacman_X_Pos_minus2] == 1'b1) || (maze_array_addr_plus12[Pacman_X_Pos_minus2] == 1'b1)) begin
                            Pacman_Y_Motion <= 0;
                            Pacman_X_Motion <= 0;
                        end
                        else begin
                            Pacman_X_Motion <= -1;
                            Pacman_Y_Motion <= 0;
                            direction <= 2'b00;
                        end
                    end
                    
            8'h07 : begin //D
                        if ((maze_array_data[Pacman_X_Pos_plus18] == 1'b1) || (maze_array_data_plus4[Pacman_X_Pos_plus18] == 1'b1)
                        || (maze_array_data_plus8[Pacman_X_Pos_plus18] == 1'b1) || (maze_array_addr_plus12[Pacman_X_Pos_plus18] == 1'b1)) begin
                            Pacman_Y_Motion <= 0;
                            Pacman_X_Motion <= 0;
                            // direction <= 2'b01;
                        end
                        else begin
                            Pacman_X_Motion <= 1;
                            Pacman_Y_Motion <= 0;
                            direction <= 2'b01;
                        end 
                    end

                        
            8'h16 : begin //S
                        if ((maze_array_data_lower[Pacman_X_Pos] == 1'b1) || (maze_array_data_lower[Pacman_X_Pos + 4] == 1'b1)
                        || (maze_array_data_lower[Pacman_X_Pos + 8] == 1'b1) || (maze_array_data_lower[Pacman_X_Pos + 12] == 1'b1)) begin
                            Pacman_Y_Motion <= 0;
                            Pacman_X_Motion <= 0;
                        end
                        else begin
                            Pacman_Y_Motion <= 1;
                            Pacman_X_Motion <= 0;
                            direction <= 2'b10;
                        end
                    end
                        
            8'h1A : begin //W
                        //look for places where pacman cannot move from
                        if ((maze_array_data_upper[Pacman_X_Pos] == 1'b1) || (maze_array_data_upper[Pacman_X_Pos + 4] == 1'b1)
                        || (maze_array_data_upper[Pacman_X_Pos + 8] == 1'b1) || (maze_array_data_upper[Pacman_X_Pos + 12] == 1'b1)) begin
                            Pacman_Y_Motion <= 0;
                            Pacman_X_Motion <= 0;
                        end
                        else begin
                            Pacman_Y_Motion <= -1;
                            Pacman_X_Motion <= 0;
                            direction <= 2'b11;
                        end
                    end	  
            default: begin
                if ((maze_array_data[Pacman_X_Pos_minus2] == 1'b1) && direction == 2'b00) begin  //A - Pacman cannot go more left 
                    Pacman_X_Motion <= '0;
                    Pacman_Y_Motion <= Pacman_Y_Motion;  
                end
                else if ((maze_array_data[Pacman_X_Pos_plus18] == 1'b1) && direction == 2'b01) begin //D - Pacman cannot go more right
                    Pacman_X_Motion <= '0;
                    Pacman_Y_Motion <= Pacman_Y_Motion;
                end   
                else if ((maze_array_data_lower[Pacman_X_Pos] == 1'b1) && direction == 2'b10) begin //S -Pacman cannot go more below
                    Pacman_Y_Motion <= '0;
                    Pacman_X_Motion <= Pacman_X_Motion;  
                end   
                else if ((maze_array_data_upper[Pacman_X_Pos] == 1'b1) && direction == 2'b11) begin //W- Pacman cannot go more up
                    Pacman_Y_Motion <= '0;
                    Pacman_X_Motion <= Pacman_X_Motion; 
                end   
                else begin
                    Pacman_Y_Motion <= Pacman_Y_Motion;  // Pacman is somewhere in the middle, don't bounce, just keep moving
                    Pacman_X_Motion <= Pacman_X_Motion;
                end
            end
        endcase
    */
    