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
reg[1:0]	state;
reg[8:0]	ping_nu;

always@(posedge clk or negedge res)begin

if(~res) begin
	d_out<=0;state<=0;ping_nu<=0;
end
else begin

	case(state)
//0状态;上升
	0:begin
	d_out<=d_out+1;
		if(d_out==299)begin
			state<=1;
		end
	end
//1平顶；
	1:begin
	ping_nu<=ping_nu+1;
		if(ping_nu==100)begin
			state<=2;ping_nu<=0;
		end
	end

//2状态;
	2:begin
	d_out<=d_out-1;
		if(d_out==1)begin
			state<=0;
		end
	end
	default:begin//其他状态；
		state<=0;
		ping_nu<=0;
	end

	endcase



end




end





endmodule
