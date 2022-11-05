//2022-7-31,罗力中；
//最简单的状态机，三角波发生器；

module tri_gen(
		clk,
		res,
		d_out
		);

input		clk;
input		res;
output[8:0]	d_out;


reg[8:0]	d_out;
reg		state;

always@(posedge clk or negedge res)begin

if(~res) begin
	d_out<=0;state<=0;
end
else begin

	case(state)
//0状态;
	0:begin
	d_out<=d_out+1;
		if(d_out==299)begin
			state<=1;
		end
	end
//1状态;
	1:begin
	d_out<=d_out-1;
		if(d_out==1)begin
			state<=0;
		end
	end


	endcase



end




end





endmodule
