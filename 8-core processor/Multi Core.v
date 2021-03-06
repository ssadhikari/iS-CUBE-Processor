module Multi_core;
	reg clk;
	reg im_rst;
	wire [15:0] PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,IM,DM1,DM2,DM3,DM4,DM5,DM6,DM7,DM8,AR1,AR2,AR3,AR4,AR5,AR6,AR7,AR8,DR1,DR2,DR3,DR4,DR5,DR6,DR7,DR8;
	wire imr1,imr2,imr3,imr4,imr5,imr6,imr7,imr8,dmr1,dmr2,dmr3,dmr4,dmr5,dmr6,dmr7,dmr8,dmw1,dmw2,dmw3,dmw4,dmw5,dmw6,dmw7,dmw8,finish1,finish2,finish3,finish4,finish5,finish6,finish7,finish8;
	wire [15:0] word[10500:0];

        parameter clk_period = 2;
	integer file,i,j;

	Instruction_memory instruction_memory(clk,im_rst,imr1,PC1,IM);
	
	Data_memory data_memory(clk,dmw1,dmr1,AR1,AR2,AR3,AR4,AR5,AR6,AR7,AR8,DR1,DR2,DR3,DR4,DR5,DR6,DR7,DR8,DM1,DM2,DM3,DM4,DM5,DM6,DM7,DM8,word);

	Top_module core1(clk,16'd1,IM,DM1,DR1,PC1,AR1,imr1,dmw1,dmr1,finish1);

	Top_module core2(clk,16'd2,IM,DM2,DR2,PC2,AR2,imr2,dmw2,dmr2,finish2);

	Top_module core3(clk,16'd3,IM,DM3,DR3,PC3,AR3,imr3,dmw3,dmr3,finish3);

	Top_module core4(clk,16'd4,IM,DM4,DR4,PC4,AR4,imr4,dmw4,dmr4,finish4);

	Top_module core5(clk,16'd5,IM,DM5,DR5,PC5,AR5,imr5,dmw5,dmr5,finish5);

	Top_module core6(clk,16'd6,IM,DM6,DR6,PC6,AR6,imr6,dmw6,dmr6,finish6);

	Top_module core7(clk,16'd7,IM,DM7,DR7,PC7,AR7,imr7,dmw7,dmr7,finish7);

	Top_module core8(clk,16'd8,IM,DM8,DR8,PC8,AR8,imr8,dmw8,dmr8,finish8);


    initial begin
       clk = 0;
	
    end
     
     always 
       #(clk_period/2) clk = ~clk;

initial 
	begin

	                file = $fopen("E:\\FPGA-Project\\new_repo\\ouputs\\out.txt","w");
			@(posedge finish1);
			for ( j = 1; j < ( word[1] + 1); j = j + 1)
				begin
					for ( i = 1; i < ( word[2] + 1); i = i + 1) $fwrite(file,"%d",word[4 + (j-1)*word[2] + i]);
					$fwrite(file,"\n");	
				end
			$fwrite(file,"\n");	
			$fwrite(file,"\n");	

			for ( j = 1; j < ( word[3] + 1); j = j + 1)
				begin
					for ( i = 1; i < ( word[4] + 1); i = i + 1) $fwrite(file,"%d",word[4 + word[1]*word[2] + (j-1)*word[4] + i]);
					$fwrite(file,"\n");	
				end
				
			$fwrite(file,"\n");	
			$fwrite(file,"\n");	

			for ( j = 1; j < ( word[1] + 1); j = j + 1)
				begin
					for ( i = 1; i < ( word[4] + 1); i = i + 1) $fwrite(file,"%d",word[4 + word[1]*word[2] +  word[3]*word[4] + (j-1)*word[4] + i]);
					$fwrite(file,"\n");	
				end
			
			$fclose(file);

			$finish;

		end
	
endmodule