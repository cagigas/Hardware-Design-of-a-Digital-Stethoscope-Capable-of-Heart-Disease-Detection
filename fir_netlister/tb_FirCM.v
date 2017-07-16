// Copyright (C) 1988-2006 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.

// Altera FIR MegaCore ver 3.3.1 Verilog HDL Testbench
`timescale 100 ps / 100 ps

module tb_FirCM;

parameter data_file_name = "FirCM_data_in.txt" ;
parameter output_file_name = "FirCM_result.txt" ;
parameter DATA_WIDTH = 0;
parameter MSB_RM = 0;
parameter LSB_RM = 0;
parameter ACCUM_WIDTH = 0;
parameter DATA_LEN = 16;
parameter ENDDAT = 279 ;
parameter NUM_OUT = 280 ;

wire [ACCUM_WIDTH - MSB_RM - LSB_RM -1:0] fir_res;
integer data_addr_cnt;
initial data_addr_cnt = 0;

wire done;
wire rdy_to_ld;
integer data[0:ENDDAT];
integer data_file;
integer i,j;
wire dav_i;
reg ena_i;
reg sop_i;
reg eop_i;
reg err_i;

wire dav_o;
reg  ena_o;
wire sop_o;
wire eop_o;
wire err_o;

//Generate control circuit
reg clk;
reg clk_en;
initial clk = 0;
always
  #50 clk <= ~clk;


integer cnt_clks;

// keep track of clocks
initial cnt_clks = 0;
always @(posedge clk)
  cnt_clks <= cnt_clks + 1'b1;

initial clk_en = 1;
always @(posedge clk)
begin
	if(cnt_clks >0&& cnt_clks<0)  clk_en <= 1'b0;
	else if(cnt_clks >0 && cnt_clks<0)  clk_en <= 1'b0;
	else if(cnt_clks >0&& cnt_clks<0) clk_en <= 1'b0;
	else					clk_en <= 1'b1;
end
// rest Unit under test
reg rst_uut;
initial rst_uut = 1;
always @(posedge clk)
begin
  if (data_cnt <= 1) rst_uut <= 1'b1;
  else               rst_uut <= 1'b0;
end                 
                 

reg start;
initial start <= 0;
always @(posedge clk)
begin
if (rst_uut == 1'b1) start <= 1; 
end 
reg pld_rst;
initial pld_rst = 1;
always @(posedge clk)
begin
  if (cnt_clks <= 3) pld_rst <= 1'b1;
  else               pld_rst <= 1'b0;
end 
//Generate control circuit with atlatic interface
reg clk;
reg clk_en;
initial clk = 1;
always
  #50 clk <= ~clk;


integer cnt_clks;

// keep track of clocks
initial cnt_clks = 0;
always @(posedge clk)
  cnt_clks <= cnt_clks + 1'b1;

integer data_cnt;
initial data_cnt = 0;

reg active_dat;
reg rst_uut;
always @(posedge clk)
begin
  if (cnt_clks == 5) rst_uut <= 1'b1;
  else              rst_uut <= 1'b0;
end

reg eop_i_ok;
initial eop_i_ok = 1'b1;
always @(posedge clk)
begin
  if (sop_i  == 1'b1)     eop_i_ok <= 1'b0;
  else if (eop_i == 1'b1) eop_i_ok <= 1'b1;
end
always @(posedge clk)
begin
  if (sop_i == 1'b1)  sop_i <= 1'b0;
  else
  if (eop_i_ok == 1'b1)
  begin
     if (ena_i == 1'b1) sop_i <= 1'b1;
     else             sop_i <= 1'b0;
 end
end

always @(posedge clk)
begin
  if (data_cnt >= DATA_LEN-2)
                 active_dat <= 1'b0;
  else if (ena_i == 1'b1) active_dat <= 1'b1;
end

always @(posedge clk)
begin
  if (sop_i == 1'b1)  data_cnt <= 1;
  else if (data_cnt == 1) data_cnt <= 2;
  else if (active_dat == 1'b1) data_cnt <= data_cnt + 1'b1;
  else if (ena_i == 1'b1)  data_cnt <= 0;
end
always @(posedge clk)
begin
  if ((eop_i == 1'b1 || active_dat == 1'b1) && data_addr_cnt == ENDDAT)      data_addr_cnt <= 0;
  else if (eop_i == 1'b1)                 data_addr_cnt <= data_addr_cnt + 1;
  else if (active_dat == 1'b1)     data_addr_cnt <= data_addr_cnt + 1'b1;
end

wire [DATA_WIDTH-1:0] data_value;
initial
    begin
    data_file = $fopen(data_file_name,"r");
	 for(j = 0; j <= ENDDAT; j = j + 1)
		i = $fscanf(data_file, "%d", data[j]);
    $fclose(data_file);
end

assign data_value = data[data_addr_cnt];

always @(posedge clk)
begin
  if (data_cnt == DATA_LEN-2 ) eop_i <= 1'b1;
  else                         eop_i <= 1'b0;
end

initial ena_i = 0;
always @(posedge clk)
begin
	if(dav_i == 1'b1) 	ena_i <= 1'b1;
	else if(data_cnt == DATA_LEN-1) ena_i <= 1'b0;
end

initial ena_o = 1'b0;
always @(posedge clk)
begin
	if(dav_o == 1'b1) 	ena_o <= 1'b1;
	else if(dav_o == 1'b0) ena_o <= 1'b0;
end
FirCM  UUT (.clk(clk),
          .rst(rst_uut),
          .dav_i(dav_i),
          .ena_i(ena_i),
          .sop_i(sop_i),
          .eop_i(eop_i),
          .dat_i(data_value),
          .dav_o(dav_o),
          .ena_o(ena_o),
          .sop_o(sop_o),
          .eop_o(eop_o),
          .dat_o(fir_res) );


// write the output to a file
integer fid_0,fid_1;
integer samp_cnt;

initial
begin
  fid_0 = $fopen("fir_results_0.txt");
  fid_1 = $fopen("fir_results_1.txt");
  samp_cnt = 0;
end
  
real fir_conv;
real conv;
reg [ACCUM_WIDTH - MSB_RM - LSB_RM : 0] conv_vec;
always @(posedge clk)
begin
conv_vec <= 1<<(ACCUM_WIDTH - MSB_RM - LSB_RM);
conv <= conv_vec;
end
  
reg eop_o_dly;
always @(posedge clk)
eop_o_dly <= eop_o;

reg rd_dat_en;
initial rd_dat_en = 0;
always @(posedge clk)
begin
	if(sop_o == 1) rd_dat_en <= 1'b1;
	if(eop_o_dly == 1) rd_dat_en <= 1'b0;
end 
always @(posedge clk)
begin
  if (fir_res[ACCUM_WIDTH - MSB_RM - LSB_RM-1] == 1 ) 
      fir_conv <= fir_res - conv;
  else
     fir_conv <= fir_res;
end 


always @(posedge clk)
begin
	if(rd_dat_en == 1 && samp_cnt < NUM_OUT)
	begin
		samp_cnt <= samp_cnt + 1;
		$fwrite (fid_0, "%17.0f\n",fir_conv);
   end
	else if(rd_dat_en == 1 && coef_set_cnt == 1)
	begin
		samp_cnt <= samp_cnt + 1;
		$fwrite (fid_1, "%17.0f\n",fir_conv);
	end
end 

// end simulation and write results into files
always @(coef_set_cnt)
begin
  if (coef_set_cnt >1)
  begin
     $fclose(fid_0);
     $fclose(fid_1);
     $stop;
  end
end
endmodule
