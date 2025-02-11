module Processor (clk,reset);

//Inputs
input clk,reset;


// wires
wire write_enable,mem_en,rw,M2R,data_read,data_write;
wire [31:0] PC_in;
wire [31:0] PC_out;
wire [15:0] IR_in,IR_out,MDR_out,write_data,operand1,operand2,result;
wire [8:0] opcode;
wire [1:0] alu_function;
wire [3:0] Rsrc,Rdst;
wire [5:0] outFlags;



// Instantiations
PC PC_reg (1'b1, clk, reset, PC_in, PC_out);

InstrMem #(16, 21) InstrCache (clk, PC_out[20:0], IR_out, reset);

// IR IR_reg (1'b1, clk, reset, IR_in, IR_out);

CU ControlUnit (opcode, mem_en, rw, data_read, data_write, alu_function);

regFile registers (data_read, data_write, operand1, operand2, write_data, 1'b0, clk, reset, Rsrc, Rdst, Rdst);

ALU_1 ALU(operand1, operand2, alu_function, result, outFlags);

DataMem  #(16, 12)  DM(clk, operand1[11:0], result,MDR_out, reset, mem_en, rw);

Incrementor  #(32) PC_INC(PC_out,PC_in);

// Mux for MDR_out || result
mux #(16) MUX1 (result,MDR_out, write_data, M2R);


//assign reset = 1'b1;
assign opcode = IR_out[15:7];
assign Rsrc = IR_out[3:0];
assign Rdst = IR_out[6:4];
assign M2R  = mem_en & rw;

endmodule
