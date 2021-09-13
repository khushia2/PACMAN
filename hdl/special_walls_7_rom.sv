module special_walls_7_rom (
    input [1:0] addr,
    output [118:0] data
);

parameter ADDR_WIDTH = 2;
parameter DATA_WIDTH = 119;

logic [ADDR_WIDTH-1:0] addr_reg;

parameter [0:3][DATA_WIDTH-1:0] ROM = {
    //Top 
    -119'd1,
    -119'd1,
    -119'd1,
    -119'd1
};

assign data = ROM[addr];

endmodule