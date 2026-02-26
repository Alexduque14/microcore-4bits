module top_module(
	input wire clk,
	input wire rst,
	output wire [6:0] data_high,
	output wire [6:0] data_low,
	output wire [6:0] state_out,
	output wire [6:0] ula_out,
	output wire [6:0] out_A,
	output wire [6:0] out_B
);
	
	//fios de conexao interna
	
	wire ena_pc;
	wire ena_ri;
	wire ena_wr;
	wire ena_ula;
	wire pc_ack;
	wire ri_ack;
	wire wr_ack;
	wire ula_ack;
	wire [7:0] addr_bus;
	wire [7:0] data_bus;
	wire [1:0] mnm;
	wire [3:0] rd_addr_wr_data;
	wire sel_r0_rd;
	wire sel_addr_data;
	wire sel_ldr_ula;
	wire [3:0] rd_addr;
	wire [1:0] wr_addr_mnm;
	wire [1:0] wr_addr;
	wire [3:0] wr_data_ula;
	wire [3:0] wr_data_ldr;
	wire [3:0] wr_data;
	wire [3:0] operando_A;
	wire [3:0] operando_B;
	wire [2:0] state;

	// Instancias dos Modulos
	
	program_counter pc(
		.clk(clk),
		.rst(rst),
		.en(ena_pc),
		.ack(pc_ack),
		.pc_out(addr_bus)
	);

	rom_8x256 rom(
		.addr(addr_bus),
		.data(data_bus)
	);

	instruction_register ins_reg(
		.clk(clk),
		.rst(rst),
		.data_in(data_bus),
		.ena(ena_ri),
		.mnm(mnm),
		.wr_addr_mnm(wr_addr_mnm),
		.rd_addr_wr_data(rd_addr_wr_data),
		.ack(ri_ack)
	);

	mux2x1_2bit mux2bit(
		.in0(2'b00),
		.in1(wr_addr_mnm),
		.sel(sel_r0_rd),
		.out(wr_addr)
	);

	demux1x2_4bit demux(
		.in(rd_addr_wr_data),
		.sel(sel_addr_data),
		.out0(wr_data_ldr),
		.out1(rd_addr)
	);

	mux2x1_4bit mux4bit(
		.in0(wr_data_ula),
		.in1(wr_data_ldr),
		.sel(sel_ldr_ula),
		.out(wr_data)
	);

	register_file register(
		.clk(clk),
		.wr_en(ena_wr),
		.wr_data(wr_data),
		.wr_addr(wr_addr),
		.rd_addr1(rd_addr[3:2]),
		.rd_addr2(rd_addr[1:0]),
		.wr_ack(wr_ack),
		.rd_data1(operando_A),
		.rd_data2(operando_B)
	);

	ula_4bit_sync ula(
		.clk(clk),
		.enable(ena_ula),
		.a(operando_A),
		.b(operando_B),
		.sel({mnm, wr_addr_mnm}),
		.result(wr_data_ula),
		.ula_ack(ula_ack)
	);

	fsm state_machine(
		.clk(clk),
		.rst(rst),
		.mnm_in(mnm),
		.ula_ack(ula_ack),
		.wr_ack(wr_ack),
		.pc_ack(pc_ack),
		.ri_ack(ri_ack),
		.ena_pc(ena_pc),
		.ena_ri(ena_ri),
		.ena_wr(ena_wr),
		.ena_ula(ena_ula),
		.sel_r0_rd(sel_r0_rd),
		.sel_addr_data(sel_addr_data),
		.sel_ldr_ula(sel_ldr_ula),
		.out(state)
	);

	// Displays 7 segmentos

	bcd_display data_hi(
		.in(data_bus[7:4]),
		.disp(data_high)
	);

	bcd_display data_lo(
		.in(data_bus[3:0]),
		.disp(data_low)
	);

	bcd_display op_A(
		.in(operando_A),
		.disp(out_A)
	);

	bcd_display op_B(
		.in(operando_B),
		.disp(out_B)
	);

	bcd_display out_ula(
		.in(wr_data_ula),
		.disp(ula_out)
	);

	bcd_display fsm_state(
		.in({1'b0, state}),
		.disp(state_out)
	);

endmodule