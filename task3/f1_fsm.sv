module f1_fsm (
    input   logic       rst,
    input   logic       en,
    input   logic       clk,
    output  logic [8:0] data_out
);

logic [8:1] sreg;

always_ff @(posedge clk, posedge rst)
    if (rst | sreg == 8'b11111111) sreg <= 8'b0;
    else if (en) sreg <= {sreg[8:1], 1'b1};

assign data_out = sreg;

endmodule
