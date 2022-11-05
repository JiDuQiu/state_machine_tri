//----testbench of tri_gen----
`timescale 1ns/10ps
module tri_gen_tb;

reg	clk;
reg	res;
wire[8:0]	d_out;

tri_gen	tri_gen(
		.clk(clk),
		.res(res),
		.d_out(d_out)
		);

initial begin
	clk<=0;res<=0;
	#17 res<=1;
	#25000 $finish;
end


always #5 clk=~clk;


initial begin
	$dumpfile("test12.vcd");
	$dumpvars(0,tri_gen_tb);

end

endmodule
