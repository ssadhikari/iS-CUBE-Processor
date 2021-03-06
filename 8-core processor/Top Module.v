module Top_module(input clk,input [15:0] id,input [15:0] IM,DM,output [15:0] DR,PC,AR,output imr,dmw,dmr,finish );
	
	
	reg pc_rst,ir_rst,dr_rst,r1_rst,r2_rst,r3_rst,r4_rst,r5_rst,r6_rst,r7_rst,r8_rst,r9_rst,r10_rst,id_rst,alu_mux_rst,im_rst,alu_rst,ar_rst,mux_rst,idw;

	wire [15:0] BUS,ALU1,ALU_MUX,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,IR,ID;
	wire [15:0] AC;
	wire acw,clac,r1w,r2w,r3w,r4w,r5w,r6w,r7w,r8w,r9w,r10w,irw,pcw,pc_inc,drw,arw,mux_alu,mux_cont,z;

           
	wire [1:0] alu_op;
	wire [2:0] mux_alu_op;
	wire [3:0] mux_op;

        parameter clk_period = 2;



	
	ALU alu(clk,rst,alu_op,AC,ALU_MUX,z,ALU1); 
	
	Main_mux main_mux1(clk,mux_rst,mux_op,mux_cont,DR,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,ID,ALU1,DM,IM,BUS);
	
	State_machine stateMachine(clk,z,IR,acw,clac,r1w,r2w,r3w,r4w,r5w,r6w,r7w,r8w,r9w,r10w,irw,pcw,pc_inc,drw,arw,imr,dmw,dmr,mux_alu,mux_cont,finish,alu_op,mux_alu_op,mux_op);         
	 
	Accumilator ac(clk,acw,clac,BUS,AC);
	
	Program_counter program_counter(clk,pcw,pc_rst,pc_inc,BUS,PC);
	
	Instruction_register instruction_register(clk,irw,ir_rst,BUS,IR);
	
	Address_register address_reg(clk,arw,ar_rst,BUS,AR);
	
	Data_register data_register(clk,drw,dr_rst,BUS,DR);
	
	General_purpose_register r1(clk,r1w,r1_rst,BUS,R1);
	
	General_purpose_register r2(clk,r2w,r2_rst,BUS,R2);
	
	General_purpose_register r3(clk,r3w,r3_rst,BUS,R3);
	
	General_purpose_register r4(clk,r4w,r4_rst,BUS,R4);
	
	General_purpose_register r5(clk,r5w,r5_rst,BUS,R5);
	
	General_purpose_register r6(clk,r6w,r6_rst,BUS,R6);
	
	General_purpose_register r7(clk,r7w,r7_rst,BUS,R7);
	
	General_purpose_register r8(clk,r8w,r8_rst,BUS,R8);
	
	General_purpose_register r9(clk,r9w,r9_rst,BUS,R9);

	General_purpose_register r10(clk,r10w,r10_rst,BUS,R10);

	General_purpose_register core_id(clk,idw,id_rst,id,ID);
	
	ALU_mux alu_mux(clk,alu_mux_rst,mux_alu_op,mux_alu,BUS,ALU_MUX);
	






	initial 
		begin
			pc_rst <=1;
			ir_rst<=1;
			dr_rst<=1;
			r1_rst<=1;
			r3_rst<=1;
			r4_rst<=1;
			r5_rst<=1;
			r6_rst<=1;
			r7_rst<=1;
			r8_rst<=1;
			r9_rst<=1;
			alu_mux_rst <=1;
			r10_rst <=1;
			r2_rst <=1;
			alu_rst <=1;
			ar_rst <= 1;
			idw <= 1;

			#(clk_period*1)

			pc_rst <=0;
			ir_rst<=0;
			dr_rst<=0;
			r1_rst<=0;
			r3_rst<=0;
			r4_rst<=0;
			r5_rst<=0;
			r6_rst<=0;
			r7_rst<=0;
			r8_rst<=0;
			r9_rst<=0;
			r10_rst <=0;
			alu_mux_rst <=0;
			im_rst <=0;
			r2_rst <=0;
			alu_rst <=0;
			idw <= 0;			
			ar_rst <= 0;



		end


endmodule

