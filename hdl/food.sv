module food (
    input Reset,
    input frame_clk,
    input [9:0] PacmanX, PacmanY,
    input [9:0] FoodPosX, FoodPosY,
    output FoodOn,
    output points
);

logic is_already_eaten;

always_ff @(posedge Reset or posedge frame_clk) begin
    if (Reset) begin
        FoodOn <= 1'b1;
        points <= 1'b0;
        is_already_eaten <= 1'b0;
    end
    else if (((PacmanX - FoodPosX <= 6) || (FoodPosX - PacmanX <= 6)) && ((PacmanY - FoodPosY <= 6) || (FoodPosY - PacmanY <= 6))) begin
        FoodOn <= 1'b0;
        if (!is_already_eaten)
            points <= 1'b1;
        is_already_eaten <= 1'b1;
    end
    else begin
        FoodOn <= FoodOn;
        points <= 1'b0;
    end
end

endmodule