
module top
  (
   // 20 MHz local board clock
   input 		 LOCAL_CLK,
   // LEDs
   output 		 LED1,
	
	// Keys
	input key0,
	input key1,

   // DDR signals
   output 		 ddr3_resetn,
   output [14:0] ddr3_a,
   output [2:0]  ddr3_ba,
   output 		 ddr3_ck_p,
   output 		 ddr3_ck_n,
   output 		 ddr3_cke,
   output 		 ddr3_csn,
   output [1:0]  ddr3_dm,
   output 		 ddr3_odt,
   output 		 ddr3_rasn,
   output 		 ddr3_casn,
   output 		 ddr3_wen,
   inout [15:0]  ddr3_dq,
   inout [1:0] 	 ddr3_dqs_p,
   inout [1:0] 	 ddr3_dqs_n,
   input 		 ddr3_rzq
   );
   
   //
   // Nets
   // 
   
   // PIO outputs
   wire [7:0] 	 pio;
   
   // System reset
   wire 		 resetn;
   
   // System PLL locked signal
   wire 		 locked;
   
   // System clock 100 MHz
   wire 		 clk;
	
	altclkctrl0 altclkctrl0_inst 
	(
	.inclk  (LOCAL_CLK),
	.outclk (clk)
	);
	
   nios u0 
	 (
      .clk_clk            (clk),
      .memory_mem_a       (ddr3_a),       
      .memory_mem_ba      (ddr3_ba),
      .memory_mem_ck      (ddr3_ck_p),
      .memory_mem_ck_n    (ddr3_ck_n),
      .memory_mem_cke     (ddr3_cke),
      .memory_mem_cs_n    (ddr3_csn),
      .memory_mem_dm      (ddr3_dm),
      .memory_mem_ras_n   (ddr3_rasn),
      .memory_mem_cas_n   (ddr3_casn),
      .memory_mem_we_n    (ddr3_wen),
      .memory_mem_reset_n (ddr3_resetn),
      .memory_mem_dq      (ddr3_dq),
      .memory_mem_dqs     (ddr3_dqs_p),
      .memory_mem_dqs_n   (ddr3_dqs_n),
      .memory_mem_odt(ddr3_odt),
	   .oct_rzqin (ddr3_rzq),
      .pio_export         (pio),
      .reset_reset_n      (resetn)
      );
   
   
   assign resetn = key0;	 
   assign LED1 = pio[1];

endmodule // top

