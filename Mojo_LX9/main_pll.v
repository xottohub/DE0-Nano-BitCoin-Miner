////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 13.1
//  \   \         Application : xaw2verilog
//  /   /         Filename : main_pll.v
// /___/   /\     Timestamp : 06/02/2011 17:02:40
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: xaw2verilog -st /home/teknohog/dcmtest/ipcore_dir/./main_pll.xaw /home/teknohog/dcmtest/ipcore_dir/./main_pll
//Design Name: main_pll
//Device: xc3s500e-4fg320
//
// Module main_pll
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
`timescale 1ns / 1ps

module main_pll # (parameter SPEED_MHZ=4) (
				CE_IN, 
                CLKIN_IN, 
                CLR_IN, 
                PRE_IN, 
                CLKIN_IBUFG_OUT, 
                CLK0_OUT, 
                CLK180_OUT, 
                LOCKED_OUT,
				MJ_CLK_FX_OUT);

    input CE_IN;
    input CLKIN_IN;
    input CLR_IN;
    input PRE_IN;
   output CLKIN_IBUFG_OUT;
   output CLK0_OUT;
   output CLK180_OUT;
   output LOCKED_OUT;
   output MJ_CLK_FX_OUT;
   
   wire CLKIN_IBUFG;
   wire CLK0_BUF;
   wire CLK180_BUF;
   wire C0_IN;
   wire C1_IN;
   wire GND_BIT;
   wire VCC_BIT;
	wire MJ_CLK_FX;
   
   assign GND_BIT = 0;
   assign VCC_BIT = 1;
   assign CLKIN_IBUFG_OUT = CLKIN_IBUFG;
   assign CLK0_OUT = C0_IN;
   assign CLK180_OUT = C1_IN;
   IBUFG  CLKIN_IBUFG_INST (.I(CLKIN_IN), 
                           .O(CLKIN_IBUFG));
   BUFG  CLK0_BUFG_INST (.I(CLK0_BUF), 
                        .O(C0_IN));
   BUFG  CLK180_BUFG_INST (.I(CLK180_BUF), 
                          .O(C1_IN));
   BUFG  MJ_BUFG_INST (.I(MJ_CLK_FX), 
                        .O(MJ_CLK_FX_OUT));
								  

   DCM_SP #( .CLK_FEEDBACK("1X"), .CLKDV_DIVIDE(5.0), .CLKFX_DIVIDE(5),
         .CLKFX_MULTIPLY(SPEED_MHZ/10), .CLKIN_DIVIDE_BY_2("FALSE"), 
         .CLKIN_PERIOD(20.000), .CLKOUT_PHASE_SHIFT("NONE"), 
         .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), .DFS_FREQUENCY_MODE("LOW"), 
         .DLL_FREQUENCY_MODE("LOW"), .DUTY_CYCLE_CORRECTION("TRUE"), 
         .FACTORY_JF(16'hC080), .PHASE_SHIFT(0), .STARTUP_WAIT("FALSE") ) 
         DCM_SP_INST (.CLKFB(C0_IN), 
                       .CLKIN(CLKIN_IBUFG), 
                       .DSSEN(GND_BIT), 
                       .PSCLK(GND_BIT), 
                       .PSEN(GND_BIT), 
                       .PSINCDEC(GND_BIT), 
                       .RST(GND_BIT), 
                       .CLKDV(), 
                       .CLKFX(MJ_CLK_FX), 
                       .CLKFX180(), 
                       .CLK0(CLK0_BUF), 
                       .CLK2X(), 
                       .CLK2X180(), 
                       .CLK90(), 
                       .CLK180(CLK180_BUF), 
                       .CLK270(), 
                       .LOCKED(LOCKED_OUT), 
                       .PSDONE(), 
                       .STATUS());
endmodule
