module State_machine(
            input clk,z,
            input [15:0] ir,
            output reg acw,clac,r1w,r2w,r3w,r4w,r5w,r6w,r7w,r8w,r9w,r10w,irw,pcw,pc_inc,drw,arw,imr,dmw,dmr,mux_alu,mux_cont,finish = 0,
	    output reg [1:0] alu_op,
	    output reg [2:0] mux_alu_op,
	    output reg [3:0] mux_op);

            reg [7:0] PS;
            reg [7:0] NS = 8'd1;

            reg [7:0] para;
            reg check = 0;

	    parameter
	       FETCH1 = 8'd1,
	       FETCH2 = 8'd2,
	       FETCH3 = 8'd3,

	       CLAC1 = 8'd4,

	       LOAD1 = 8'd5,
	       LOAD2 = 8'd6,
	       LOAD3 = 8'd7,
	       LOAD4 = 8'd8,

	       INAC1 = 8'd9,
	       INAC2= 8'd10,

	       MVAC1 = 8'd11,

	       COPY1 = 8'd12,

	       STOR1 = 8'd13,
	       STOR2 = 8'd14,
	       STOR3 = 8'd15,

	       JPNZY1 = 8'd16,
	       JPNZY2 = 8'd17,
	       //JPNZY3 = 8'd18,

	       JPNZN1 = 8'd19,

	       LODM1 = 8'd20,
	       LODM2 = 8'd21,
	       LODM3 = 8'd22,

	       ADD1 = 8'd23,
	       ADD2 = 8'd24,

	       SUB1 = 8'd25,
	       SUB2 = 8'd26,

	       MUL1 = 8'd27,
	       MUL2 = 8'd28,

	       NOP1 = 8'd29,

	       END = 8'd30,

               dr_s = 1,
	       
               ADD = 2'd1,
	       SUB = 2'd2,
               MUL = 2'd3,

               BUS = 2'd0,

               AC_VALUE = 4'd1,
               DR_VALUE = 4'd2,
               R1_VALUE = 4'd3,
               R2_VALUE = 4'd4,
               R3_VALUE = 4'd5,
               R4_VALUE = 4'd6,
               R5_VALUE = 4'd7,
               R6_VALUE = 4'd8,
               R7_VALUE = 4'd9,
               R8_VALUE = 4'd10,
               R9_VALUE = 4'd11,
	       R10_VALUE = 4'd12,
               DM_VALUE = 4'd13,
               IM_VALUE = 4'd14,
	       ID_VALUE = 4'd15;


            always@(posedge clk) 
             begin 
               if ( check )                                          // check the next instruction
                 begin
                    if(ir[7:0]==JPNZY1 && z==1)                      // check the looping condition
                       begin
                          PS<=JPNZN1;                                // go to no  branch if the z flag is zero
                       end
                    else if(ir[7:0]==8'd0) PS<=FETCH1;
                    else
                       begin
                          PS<=ir[7:0];
                      end
                 end
              else PS <= NS;
             end

            always@(negedge clk)
             begin 
               case(PS)
                    FETCH1:begin
                            acw<=0;
                            clac<=0;
                            r1w<=0;
                            r2w<=0;
                            r3w<=0;
                            r4w<=0;
                            r5w<=0;
                            r6w<=0;
                            r7w<=0;
                            r8w<=0;
                            r9w<=0;
                            r10w<=0;
                            irw<=0;
                            pcw<=0;
                            pc_inc<=0;
                            drw<=0;
                            arw<=0;
                            imr<=1;
                            dmw<=0;
                            dmr<=0;
                            mux_cont<=0;
                            mux_alu<=0;
                            alu_op<=0;
			    mux_op<=0;
			    mux_alu_op<=0;
                            finish<=0;
                            NS<=FETCH2;
                            check<=0;
                           end 

                    FETCH2:begin
                            acw<=0;
                            clac<=0;
                            r1w<=0;
                            r2w<=0;
                            r3w<=0;
                            r4w<=0;
                            r5w<=0;
                            r6w<=0;
                            r7w<=0;
                            r8w<=0;
                            r9w<=0;
                            r10w<=0;
                            irw<=1;
                            pcw<=0;
                            pc_inc<=0;
                            drw<=0;
                            arw<=0;
                            imr<=0;
                            dmw<=0;
                            dmr<=0;
                            mux_cont<=dr_s;
                            mux_alu<=0;
                            alu_op<=0;
			    mux_op<=IM_VALUE;
			    mux_alu_op<=0;
                            finish<=0;
                            NS<=FETCH3;
                            check<=0;
                           end  

                    FETCH3:begin
                            acw<=0;
                            clac<=0;
                            r1w<=0;
                            r2w<=0;
                            r3w<=0;
                            r4w<=0;
                            r5w<=0;
                            r6w<=0;
                            r7w<=0;
                            r8w<=0;
                            r9w<=0;
                            r10w<=0;
                            irw<=0;
                            pcw<=0;
                            pc_inc<=1;
                            drw<=0;
                            arw<=0;
                            imr<=0;
                            dmw<=0;
                            dmr<=0;
                            mux_cont<=0;
                            mux_alu<=0;
                            alu_op<=0;
			    mux_op<= 0;
			    mux_alu_op<=0;
                            finish<=0;
                            NS<=0;
                            check<=1;
                           end 

                    CLAC1:begin
                            acw<=0;
                            clac<=1;
                            r1w<=0;
                            r2w<=0;
                            r3w<=0;
                            r4w<=0;
                            r5w<=0;
                            r6w<=0;
                            r7w<=0;
                            r8w<=0;
                            r9w<=0;
                            r10w<=0;
                            irw<=0;
                            pcw<=0;
                            pc_inc<=0;
                            drw<=0;
                            arw<=0;
                            imr<=0;
                            dmw<=0;
                            dmr<=0;
                            mux_cont<=0;
                            mux_alu<=0;
			    mux_alu_op<=0;
                            alu_op<=0;
			    mux_op<= 0;
                            finish<=0;
                            NS<=FETCH1;
                            check<=0;
                           end 

                    LOAD1: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 1;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 1;
	                   dmr <= 0;
                           dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= 0;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= 0;
	                   NS <= LOAD2;
	                   finish <= 0;
                           check<=0;
                          end

                    LOAD2: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 1;
	                   imr <= 0;
	                   dmr <= 0;
                           dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= IM_VALUE;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= dr_s;
	                   NS <= LOAD3;
	                   finish <= 0;
                           check<=0;
                          end

                    LOAD3: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 1;
                           dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= 0;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= 0;
	                   NS <= LOAD4;
	                   finish <= 0;
                           check<=0;
                          end

                   LOAD4: begin                     //p <= DR
	                  clac <= 0;
	                  case (ir[15:8])
		               8'd1 : r1w <= 1;
		               8'd2 : r2w <= 1;
		               8'd3 : r3w <= 1;
		               8'd4 : r4w <= 1;
		               8'd5 : r5w <= 1;
		               8'd6 : r6w <= 1;
		               8'd7 : r7w <= 1;
		               8'd8 : r8w <= 1;
		               8'd9 : r9w <= 1;
		               8'd10: r10w <= 1;
			       8'd11: acw <= 1;
	                 endcase
	                 irw <= 0;
	                 pcw <= 0;
	                 pc_inc <= 0;
	                 drw <= 0;
	                 arw <= 0;
	                 imr <= 0;
	                 dmr <= 0;
                         dmw <= 0;
	                 alu_op <= 0;
	                 mux_alu <= 0;
	                 mux_cont <= dr_s;
			 mux_op<= DM_VALUE;
			 mux_alu_op<=0;
	                 NS <= FETCH1;
	                 finish <= 0;
                         check<=0;
                        end

		INAC1: begin
			acw <= 0;
	                clac <= 0;
	                r1w <= 0;
	                r2w <= 0;
	                r3w <= 0;
	                r4w <= 0;
	                r5w <= 0;
	                r6w <= 0;
	                r7w <= 0;
	                r8w <= 0;
	                r9w <= 0;
	                r10w <= 0;
	                irw <= 0;
	                pcw <= 0;
	                pc_inc <= 0;
	                drw <= 0;
	                arw <= 0;
	                imr <= 0;
	                dmr <= 0;
                        alu_op <= ADD;
	                mux_alu <= 1;
			case (ir[15:8])
		               8'd1 : mux_alu_op <= 3'd1;
		               8'd2 : mux_alu_op <= 3'd2;
		               8'd3 : mux_alu_op <= 3'd3;
		               8'd4 : mux_alu_op <= 3'd4;
			endcase
	                mux_cont <= 0;
	                NS <= INAC2;
	                finish <= 0;
                        check<=0;
                       end

                    INAC2: begin
	                   acw <= 1;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
                           dmw <= 0;
	                   alu_op <= 0;
	                   mux_cont <= dr_s;
			   mux_op<= AC_VALUE;
			   mux_alu_op<= 0;
	                   mux_alu <= 0;
	                   NS <= FETCH1;
	                   finish <= 0;
                           check<=0;
                          end

		MVAC1: begin                     //p <= AC
	                  acw <= 0;
	                  clac <= 0;
	                  case (ir[15:8])
		               8'd1 : r1w <= 1;
		               8'd2 : r2w <= 1;
		               8'd3 : r3w <= 1;
		               8'd4 : r4w <= 1;
		               8'd5 : r5w <= 1;
		               8'd6 : r6w <= 1;
		               8'd7 : r7w <= 1;
		               8'd8 : r8w <= 1;
		               8'd9 : r9w <= 1;
		               8'd10 : r10w <= 1;
	                 endcase
	                 irw <= 0;
	                 pcw <= 0;
	                 pc_inc <= 0;
	                 drw <= 0;
	                 arw <= 0;
	                 imr <= 0;
	                 dmr <= 0;
                         dmw <= 0;
			 mux_alu_op<= 0;
	                 mux_cont <= 1;
			 mux_op<= AC_VALUE;
	                 alu_op <= 0;
	                 mux_alu <= 0;
	                 NS <= FETCH1;
	                 finish <= 0;
                         check<=0;
                        end

                   COPY1: begin                     //AC <= p
	                  acw <= 1;
	                  clac <= 0;
	                  r1w <= 0;
	                  r2w <= 0;
	                  r3w <= 0;
	                  r4w <= 0;
	                  r5w <= 0;
	                  r6w <= 0;
	                  r7w <= 0;
	                  r8w <= 0;
	                  r9w <= 0;
	                  r10w <= 0;
	                 mux_cont <= dr_s;
	                  case (ir[15:8])
		               8'd1 : mux_op <= R1_VALUE;
		               8'd2 : mux_op <= R2_VALUE;
		               8'd3 : mux_op <= R3_VALUE;
		               8'd4 : mux_op <= R4_VALUE;
		               8'd5 : mux_op <= R5_VALUE;
		               8'd6 : mux_op <= R6_VALUE;
		               8'd7 : mux_op <= R7_VALUE;
		               8'd8 : mux_op <= R8_VALUE;
		               8'd9 : mux_op <= R9_VALUE;
		               8'd10 : mux_op <= R10_VALUE;
		               8'd11 : mux_op <= ID_VALUE;
	                 endcase
	                 irw <= 0;
	                 pcw <= 0;
	                 pc_inc <= 0;
	                 drw <= 0;
	                 arw <= 0;
	                 imr <= 0;
	                 dmr <= 0;
                         dmw <= 0;
			 mux_alu_op<= 0;
	                 alu_op <= 0;
	                 mux_alu <= 0;
	                 NS <= FETCH1;
	                 finish <= 0;
                         check<=0;
                        end

                   STOR1: begin                     //AC <= p
	                  acw <= 0;
	                  clac <= 0;
	                  r1w <= 0;
	                  r2w <= 0;
	                  r3w <= 0;
	                  r4w <= 0;
	                  r5w <= 0;
	                  r6w <= 0;
	                  r7w <= 0;
	                  r8w <= 0;
	                  r9w <= 0;
	                  r10w <= 0;
	                  mux_cont <= dr_s;
	                  case (ir[15:8])
		               8'd1 : mux_op <= R1_VALUE;
		               8'd2 : mux_op <= R2_VALUE;
		               8'd3 : mux_op <= R3_VALUE;
		               8'd4 : mux_op <= R4_VALUE;
		               8'd5 : mux_op <= R5_VALUE;
		               8'd6 : mux_op <= R6_VALUE;
		               8'd7 : mux_op <= R7_VALUE;
		               8'd8 : mux_op <= R8_VALUE;
		               8'd9 : mux_op <= R9_VALUE;
		               8'd10 : mux_op <= R10_VALUE;
		               8'd11 : mux_op <= ID_VALUE;
	                 endcase
	                 irw <= 0;
	                 pcw <= 0;
	                 pc_inc <= 0;
	                 drw <= 0;
	                 arw <= 1;
	                 imr <= 0;
	                 dmr <= 0;
                         dmw <= 0;
			 mux_alu_op<= 0;
	                 alu_op <= 0;
	                 mux_alu <= 0;
	                 NS <= STOR2;
	                 finish <= 0;
                         check<=0;
                        end

                    STOR2: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 1;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= 0;
	                   mux_cont <= dr_s;
			   mux_op<= AC_VALUE;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   NS <= STOR3;
	                   finish <= 0;
                           check<=0;
                          end

                    STOR3: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 1;
	                   alu_op <= 0;
			   mux_op<= 0;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= 0;
	                   NS <= FETCH1;
	                   finish <= 0;
                           check<=0;
                          end

                    JPNZY1: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 1;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= 0;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= 0;
	                   NS <= JPNZY2;
	                   finish <= 0;
                           check<=0;
                          end

                    JPNZY2: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 1;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= IM_VALUE;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= dr_s;
	                   NS <= FETCH1;
	                   finish <= 0;
                           check<=0;
                          end

                    JPNZN1: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 1;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= 0;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= 0;
	                   NS <= FETCH1;
	                   finish <= 0;
                           check<=0;
                          end

                    ADD1: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= ADD;
	                   mux_cont = dr_s;
			   case (ir[15:8])
		               8'd1 : mux_op = R1_VALUE;
		               8'd2 : mux_op = R2_VALUE;
		               8'd3 : mux_op = R3_VALUE;
		               8'd4 : mux_op = R4_VALUE;
		               8'd5 : mux_op = R5_VALUE;
		               8'd6 : mux_op = R6_VALUE;
		               8'd7 : mux_op = R7_VALUE;
		               8'd8 : mux_op = R8_VALUE;
		               8'd9 : mux_op = R9_VALUE;
		               8'd10 : mux_op <= R10_VALUE;
		               8'd11 : mux_op <= ID_VALUE;
	                   endcase
			   mux_alu_op = BUS;                    //use blocking statements
	                   //mux_alu = mux_cont;
			   mux_alu = dr_s;
	                   NS <= ADD2;
	                   finish <= 0;
                           check<=0;
                          end

                    ADD2: begin
	                   acw <= 1;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= AC_VALUE;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= 1;
	                   NS <= FETCH1;
	                   finish <= 0;
                           check<=0;
                          end

                    SUB1: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= SUB;
	                   mux_cont = dr_s;
			   case (ir[15:8])
		               8'd1 : mux_op = R1_VALUE;
		               8'd2 : mux_op = R2_VALUE;
		               8'd3 : mux_op = R3_VALUE;
		               8'd4 : mux_op = R4_VALUE;
		               8'd5 : mux_op = R5_VALUE;
		               8'd6 : mux_op = R6_VALUE;
		               8'd7 : mux_op = R7_VALUE;
		               8'd8 : mux_op = R8_VALUE;
		               8'd9 : mux_op = R9_VALUE;
		               8'd10 : mux_op <= R10_VALUE;
		               8'd11 : mux_op <= ID_VALUE;
	                   endcase
	                   mux_alu = dr_s;
			   mux_alu_op = BUS;
	                   NS <= SUB2;
	                   finish <= 0;
                           check<=0;
                          end

                    SUB2: begin
	                   acw <= 1;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= AC_VALUE;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= 1;
	                   NS <= FETCH1;
	                   finish <= 0;
                           check<=0;
                          end

                    MUL1: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= MUL;
	                   mux_cont = dr_s;
			   case (ir[15:8])
		               8'd1 : mux_op = R1_VALUE;
		               8'd2 : mux_op = R2_VALUE;
		               8'd3 : mux_op = R3_VALUE;
		               8'd4 : mux_op = R4_VALUE;
		               8'd5 : mux_op = R5_VALUE;
		               8'd6 : mux_op = R6_VALUE;
		               8'd7 : mux_op = R7_VALUE;
		               8'd8 : mux_op = R8_VALUE;
		               8'd9 : mux_op = R9_VALUE;
		               8'd10 : mux_op <= R10_VALUE;
		               8'd11 : mux_op <= ID_VALUE;
	                   endcase
	                   mux_alu = dr_s;
			   mux_alu_op = BUS;
	                   NS <= MUL2;
	                   finish <= 0;
                           check<=0;
                          end

                    MUL2: begin
	                   acw <= 1;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= 0;
	                   mux_cont <= dr_s;
			   mux_op<= AC_VALUE;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   NS <= FETCH1;
	                   finish <= 0;
                           check<=0;
                          end

                    LODM1: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 1;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= 0;
	                   mux_cont <= dr_s;
			   case (ir[15:8])
		               8'd1 : mux_op <= R1_VALUE;
		               8'd2 : mux_op <= R2_VALUE;
		               8'd3 : mux_op <= R3_VALUE;
		               8'd4 : mux_op <= R4_VALUE;
		               8'd5 : mux_op <= R5_VALUE;
		               8'd6 : mux_op <= R6_VALUE;
		               8'd7 : mux_op <= R7_VALUE;
		               8'd8 : mux_op <= R8_VALUE;
		               8'd9 : mux_op <= R9_VALUE;
		               8'd10 : mux_op <= R10_VALUE;
		               8'd11 : mux_op <= ID_VALUE;
	                   endcase
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   NS <= LODM2;
	                   finish <= 0;
                           check<=0;
                          end

                    LODM2: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 1;
			   dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= 0;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= 0;
	                   NS <= LODM3;
	                   finish <= 0;
                           check<=0;
                          end

                    LODM3: begin
	                   acw <= 1;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= DM_VALUE;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= dr_s;
	                   NS <= FETCH1;
	                   finish <= 0;
                           check<=0;
                          end

                    NOP1: begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 1;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= 0;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= 0;
	                   NS <= FETCH1;
	                   finish <= 0;
                           check<=0;
                          end
			END : begin
	                   acw <= 0;
	                   clac <= 0;
	                   r1w <= 0;
	                   r2w <= 0;
	                   r3w <= 0;
	                   r4w <= 0;
	                   r5w <= 0;
	                   r6w <= 0;
	                   r7w <= 0;
	                   r8w <= 0;
	                   r9w <= 0;
	                   r10w <= 0;
	                   irw <= 0;
	                   pcw <= 0;
	                   pc_inc <= 0;
	                   drw <= 0;
	                   arw <= 0;
	                   imr <= 0;
	                   dmr <= 0;
			   dmw <= 0;
	                   alu_op <= 0;
			   mux_op<= 0;
			   mux_alu_op<=0;
	                   mux_alu <= 0;
	                   mux_cont <= 0;
	                   NS <= FETCH1;
	                   finish <= 1;
                           check<=0;	       
			     end
                default : NS <= FETCH1;

            endcase
        end
endmodule
	




