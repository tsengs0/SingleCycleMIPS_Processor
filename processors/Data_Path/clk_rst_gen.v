//`timescale 1ns / 1ps
`default_nettype none

/******************************************************************************************************/
module clockgen1 #(
	parameter DIVIDE = 20,
	parameter MULTIPLY = 2
)
	(CLK_IN, CLK_OUT, LOCKED);
    input  CLK_IN;
    output CLK_OUT, LOCKED;

    wire   CLK_OBUF, CLK_IBUF, CLK0, CLK0_OUT;

    BUFG   obuf (.I(CLK_OBUF), .O(CLK_OUT));
    BUFG   fbuf (.I(CLK0),     .O(CLK0_OUT));
    assign CLK_IBUF = CLK_IN;
    
    DCM_SP dcm (.CLKIN(CLK_IBUF), .CLKFX(CLK_OBUF), .CLK0(CLK0), .CLKFB(CLK0_OUT),
                .LOCKED(LOCKED), .RST(1'b0), .DSSEN(1'b0), .PSCLK(1'b0),
                .PSEN(1'b0), .PSINCDEC(1'b0));
    defparam dcm.CLKFX_DIVIDE   = DIVIDE;
    defparam dcm.CLKFX_MULTIPLY = MULTIPLY;
    defparam dcm.CLKIN_PERIOD   = 10.000; // 100MHz input clock
endmodule

/******************************************************************************************************/
module clockgen2 # (
	parameter DIVIDE = 20,
	parameter MULTIPLY = 4
)
	(CLK_IN, CLK_OUT, LOCKED);
    input  CLK_IN;
    output CLK_OUT, LOCKED;

    wire   CLK_OBUF, CLK_IBUF, CLK0, CLK0_OUT;

    BUFG   obuf (.I(CLK_OBUF), .O(CLK_OUT));
    BUFG   fbuf (.I(CLK0),     .O(CLK0_OUT));
    assign CLK_IBUF = CLK_IN;
    
    DCM_SP dcm (.CLKIN(CLK_IBUF), .CLKFX(CLK_OBUF), .CLK0(CLK0), .CLKFB(CLK0_OUT),
                .LOCKED(LOCKED), .RST(1'b0), .DSSEN(1'b0), .PSCLK(1'b0),
                .PSEN(1'b0), .PSINCDEC(1'b0));
    defparam dcm.CLKFX_DIVIDE   = DIVIDE;
    defparam dcm.CLKFX_MULTIPLY = MULTIPLY;
    defparam dcm.CLKIN_PERIOD   = 10.000; // 100MHz input clock
endmodule

/******************************************************************************************************/

module clk_rst_gen #(
	parameter CCLK_DIV = 20,
	parameter CCLK_MUL = 2,
	parameter MCLK_DIV = 20,
	parameter MCLK_MUL = 4
)
	( CLK, RST, cclk, mclk, crst );
    input CLK;
    input RST;
    output cclk;
    output mclk;
    output crst;

	wire clk0, cclk_locked, mclk_locked;
	wire cclk_obuf, cclk_in, cclk_out;
	wire mclk_obuf, mclk_in, mclk_out;
	wire rst_in, rst_n;

	IBUFG ibufg_map ( .I(CLK), .O(clk0) );

// CPU???????cclk???(????????clockgen1??????????)
	clockgen1 #( .DIVIDE(CCLK_DIV), .MULTIPLY(CCLK_MUL) ) clockgen1_map (
				.CLK_IN(clk0),
				.CLK_OUT(cclk),
				.LOCKED(cclk_locked)
	);

// INST_MEM?DATA_MEM????????mclk???(mclk2?cclk??2???)
	clockgen2 #( .DIVIDE(MCLK_DIV), .MULTIPLY(MCLK_MUL) ) clockgen2_map (
				.CLK_IN(clk0),
				.CLK_OUT(mclk),
				.LOCKED(mclk_locked)
	);

	assign rst_in = RST & cclk_locked & mclk_locked;
	assign crst = !rst_in;//!rst_n;  // CPU??????????crst

endmodule