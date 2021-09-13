module special_walls_4_rom (
    input [1:0] addr,
    output [74:0] data
);

parameter ADDR_WIDTH = 2;
parameter DATA_WIDTH = 75;

logic [ADDR_WIDTH-1:0] addr_reg;

parameter [0:3][DATA_WIDTH-1:0] ROM = {
    //Top 
    -75'd1,
    -75'd1,
    -75'd1,
    -75'd1
};

assign data = ROM[addr];

endmodule