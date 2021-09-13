module food_rom (
    input [3:0] addr,
    output [7:0] data
);

parameter ADDR_WIDTH = 4;
parameter DATA_WIDTH = 8;

logic [ADDR_WIDTH-1:0] addr_reg;

parameter [0:15][DATA_WIDTH-1:0] ROM = { 
    8'b00000000, // 0
    8'b00000000, // 1
    8'b00000000, // 2
    8'b00000000, // 3
    8'b00010000, // 4    *
    8'b00111000, // 5   ***
    8'b01111100, // 6  *****
    8'b11111110, // 7 *******
    8'b01111100, // 8  *****
    8'b00111000, // 9   ***
    8'b00010000, // a    *
    8'b00000000, // b
    8'b00000000, // c
    8'b00000000, // d
    8'b00000000, // e
    8'b00000000 // f
};

assign data = ROM[addr];

endmodule