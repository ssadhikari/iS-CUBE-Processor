module Data_memory(clk,write,read,address1,address2,address3,address4,address5,address6,address7,address8,data_in1,data_in2,data_in3,data_in4,data_in5,data_in6,data_in7,data_in8,data_out1,data_out2,data_out3,data_out4,data_out5,data_out6,data_out7,data_out8,word);
	input clk,write,read; 
	input [15:0] address1,address2,address3,address4,address5,address6,address7,address8,data_in1,data_in2,data_in3,data_in4,data_in5,data_in6,data_in7,data_in8;
	output reg [15:0] data_out1,data_out2,data_out3,data_out4, data_out5,data_out6,data_out7,data_out8; 
	output reg [15:0] word[10500:0];
	
	integer dataFile,i;	
initial 
	begin
//		word[1]=16'd2;
//		word[2]=16'd2;
//		word[3]=16'd2;
//		word[4]=16'd2;
//		word[5]=16'd1;
//		word[6]=16'd2;
//		word[7]=16'd3;
//		word[8]=16'd4;
//		word[9]=16'd5;
//		word[10]=16'd6;
//		word[11]=16'd7;
//		word[12]=16'd8;

                dataFile = $fopen("E:\\FPGA-Project\\new_repo\\ouputs\\data.txt","r");

		for(i=1;i<=10500;i=i+1)
		       begin
		           $fscanf(dataFile,"%d",word[i]);
		       end
		$fclose(dataFile);		


	end
	always@(posedge clk)
		begin
 			if(write)
				begin 
					if (address1 < (5+word[1]*word[2]+word[3]*word[4]+word[1]*word[4])) word[address1]<=data_in1;
					if (address2 < (5+word[1]*word[2]+word[3]*word[4]+word[1]*word[4])) word[address2]<=data_in2;
					if (address3 < (5+word[1]*word[2]+word[3]*word[4]+word[1]*word[4])) word[address3]<=data_in3;
					if (address4 < (5+word[1]*word[2]+word[3]*word[4]+word[1]*word[4])) word[address4]<=data_in4;
					if (address5 < (5+word[1]*word[2]+word[3]*word[4]+word[1]*word[4])) word[address5]<=data_in5;
					if (address6 < (5+word[1]*word[2]+word[3]*word[4]+word[1]*word[4])) word[address6]<=data_in6;
					if (address7 < (5+word[1]*word[2]+word[3]*word[4]+word[1]*word[4])) word[address7]<=data_in7;
					if (address8 < (5+word[1]*word[2]+word[3]*word[4]+word[1]*word[4])) word[address8]<=data_in8;
				end
			else if(read) 
				begin
					data_out1<= word[address1];
					data_out2<= word[address2];
					data_out3<= word[address3];
					data_out4<= word[address4];
					data_out5<= word[address5];
					data_out6<= word[address6];
					data_out7<= word[address7];
					data_out8<= word[address8];

				end
		end 
endmodule
