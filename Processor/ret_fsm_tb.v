module ret_fsm_tb;

parameter POP_PC_HIGH = 1'b0;
parameter POP_PC_LOW = 1'b1;

parameter POP_PC_HIGH_OP = 16'b0110000010001001;
parameter POP_PC_LOW_OP = 16'b0110000010001000;


reg ret,clk,reset;

wire [15:0]out;
wire stall;


reg current_state;
reg next_state;
ret_fsm retFsm(reset,ret,clk,out,stall);
always #10 clk = ~clk;

initial begin
	clk = 0;
	reset = 1;
	ret = 0;
	#40;
	reset = 0;
	#20;
	reset = 1;
	ret = 1;
	#20;
	if(out == POP_PC_HIGH_OP && stall == 1)
		$display("PASS 1");
	else 
		$display("FALID %d",out);
	ret = 0;
	#20;
	if(out == POP_PC_LOW_OP && stall == 1)
		$display("PASS 2");
	else 
		$display("FALID %d",out);
	#20;
	if(out == 16'b0 && stall == 1)
		$display("PASS 3");
	else 
		$display("FALID %d",out);
	#20;
	if(out == 16'b0 && stall == 1)
		$display("PASS 4");
	else 
		$display("FALID %d",out);
	#20;
	if(out == 16'b0 && stall == 1)
		$display("PASS 5");
	else 
		$display("FALID %d",out);
	#20;
	if(out == 16'b0 && stall == 1)
		$display("PASS 6");
	else 
		$display("FALID %d",out);
	#20;
	if(out == POP_PC_HIGH_OP && stall == 0)
		$display("PASS no call");
	else 
		$display("FALID %d",out);
	#20;
	if(out == POP_PC_HIGH_OP && stall == 0)
		$display("PASS no call");
	else 
		$display("FALID %d",out);
	#20;
	if(out == POP_PC_HIGH_OP && stall == 0)
		$display("PASS no call");
	else 
		$display("FALID %d",out);
	#20;
	if(out == POP_PC_HIGH_OP && stall == 0)
		$display("PASS no call");
	else 
		$display("FALID %d",out);
	ret = 1;
	#20;
	if(out == POP_PC_HIGH_OP && stall == 1)
		$display("PASS 1");
	else 
		$display("FALID %d",out);
	#20;
	ret = 0;
	if(out == POP_PC_LOW_OP && stall == 1)
		$display("PASS 2");
	else 
		$display("FALID %d",out);
	#20;
	if(out == 16'b0 && stall == 1)
		$display("PASS 3");
	else 
		$display("FALID %d",out);
	#20;
	if(out == 16'b0 && stall == 1)
		$display("PASS 4");
	else 
		$display("FALID %d",out);
	#20;
	if(out == 16'b0 && stall == 1)
		$display("PASS 5");
	else 
		$display("FALID %d",out);
	#20;
	if(out == 16'b0 && stall == 1)
		$display("PASS 6");
	else 
		$display("FALID %d",out);
	#20;
	$finish;
end
endmodule
