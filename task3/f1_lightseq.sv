module f1_lightseq #(
    parameter WIDTH = 16
)(
    input   logic       rst,
    input   logic       en,
    input   logic       clk,
    input  logic [WIDTH-1:0] N,  
    output  logic [8:0] data_out
);

logic tick;

clktick #(.WIDTH(WIDTH)) u_clktick (
    .clk(clk),
    .rst(rst),
    .en(en),
    .N(N),
    .tick(tick)
);

f1_fsm u_f1_fsm (
    .rst(rst),
    .en(tick),
    .clk(clk),
    .data_out(data_out)
);

endmodule
