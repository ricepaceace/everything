//----------------------------------------------------------------------------
// user_logic.v - module
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:          user_logic.v
// Version:           1.00.a
// Description:       User logic module.
// Date:              Mon Mar 18 10:19:34 2013 (by Create and Import Peripheral Wizard)
// Verilog Standard:  Verilog-2001
// Revision History:
//										03-26-13    Rev 01.00    GL    Initial Release
//----------------------------------------------------------------------------
// Naming Conventions:
//   active low signals:                    "*_n"
//   clock signals:                         "clk", "clk_div#", "clk_#x"
//   reset signals:                         "rst", "rst_n"
//   generics:                              "C_*"
//   user defined types:                    "*_TYPE"
//   state machine next state:              "*_ns"
//   state machine current state:           "*_cs"
//   combinatorial signals:                 "*_com"
//   pipelined or register delay signals:   "*_d#"
//   counter signals:                       "*cnt*"
//   clock enable signals:                  "*_ce"
//   internal version of output port:       "*_i"
//   device pins:                           "*_pin"
//   ports:                                 "- Names begin with Uppercase"
//   processes:                             "*_PROCESS"
//   component instantiations:              "<ENTITY_>I_<#|FUNC>"
//----------------------------------------------------------------------------

`uselib lib=unisims_ver
`uselib lib=proc_common_v3_00_a

module user_logic
(
  // -- ADD USER PORTS BELOW THIS LINE ---------------
  // --USER ports added here 
  SCLK,
  MISO,
  CS,
  IP_INTR,
  // -- ADD USER PORTS ABOVE THIS LINE ---------------

  // -- DO NOT EDIT BELOW THIS LINE ------------------
  // -- Bus protocol ports, do not add to or delete 
  Bus2IP_Clk,                     // Bus to IP clock
  Bus2IP_Resetn,                  // Bus to IP reset
  Bus2IP_Data,                    // Bus to IP data bus
  Bus2IP_BE,                      // Bus to IP byte enables
  Bus2IP_RdCE,                    // Bus to IP read chip enable
  Bus2IP_WrCE,                    // Bus to IP write chip enable
  IP2Bus_Data,                    // IP to Bus data bus
  IP2Bus_RdAck,                   // IP to Bus read transfer acknowledgement
  IP2Bus_WrAck,                   // IP to Bus write transfer acknowledgement
  IP2Bus_Error                    // IP to Bus error response
  // -- DO NOT EDIT ABOVE THIS LINE ------------------
); // user_logic

// -- ADD USER PARAMETERS BELOW THIS LINE ------------
// --USER parameters added here 
// -- ADD USER PARAMETERS ABOVE THIS LINE ------------

// -- DO NOT EDIT BELOW THIS LINE --------------------
// -- Bus protocol parameters, do not add to or delete
parameter C_NUM_REG                      = 6;
parameter C_SLV_DWIDTH                   = 32;
// -- DO NOT EDIT ABOVE THIS LINE --------------------

// -- ADD USER PORTS BELOW THIS LINE -----------------
// --USER ports added here 
output reg SCLK;
input MISO;
output reg CS;
output reg IP_INTR;
// -- ADD USER PORTS ABOVE THIS LINE -----------------

// -- DO NOT EDIT BELOW THIS LINE --------------------
// -- Bus protocol ports, do not add to or delete
input                                     Bus2IP_Clk;
input                                     Bus2IP_Resetn;
input      [C_SLV_DWIDTH-1 : 0]           Bus2IP_Data;
input      [C_SLV_DWIDTH/8-1 : 0]         Bus2IP_BE;
input      [C_NUM_REG-1 : 0]              Bus2IP_RdCE;
input      [C_NUM_REG-1 : 0]              Bus2IP_WrCE;
output reg [C_SLV_DWIDTH-1 : 0]           IP2Bus_Data;
output reg                                IP2Bus_RdAck;
output reg                                IP2Bus_WrAck;
output reg                                IP2Bus_Error;
// -- DO NOT EDIT ABOVE THIS LINE --------------------

//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------

  // --USER nets declarations added here, as needed for user logic
	
  reg [31:0] delay_counter;
	reg [20:0] sample_counter;
  reg [31:0] ip_clk_counter;
	reg o_clk;
	reg [4:0] state;
	reg data_available;
	reg [4:0] clock_counter;
	reg [15:0] spi_data;

  // Nets for user logic slave model s/w accessible register example
  reg        [C_SLV_DWIDTH-1 : 0]           adc_start_reg;
  reg        [C_SLV_DWIDTH-1 : 0]           delay_reg;
  reg        [C_SLV_DWIDTH-1 : 0]           clk_divider_reg;
  reg        [C_SLV_DWIDTH-1 : 0]           intr_status_reg;
  reg        [C_SLV_DWIDTH-1 : 0]           intr_enable_reg;
  reg        [C_SLV_DWIDTH-1 : 0]           adc_data_reg;
  wire       [5  : 0]                       slv_reg_write_sel;
  wire       [5  : 0]                       slv_reg_read_sel;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_ip2bus_data;
  wire                                      slv_read_ack;
  wire                                      slv_write_ack;
  integer                                   byte_index, bit_index;

  // USER logic implementation added here

initial
begin
	CS<=1;
	SCLK<=0;
	data_available<=0;
	IP_INTR<=0;
	o_clk<=0;
	delay_counter<=0;
	state<=5'b00001;
	ip_clk_counter<=0;
	clock_counter<=0;
	spi_data<=0;
end

  assign
    slv_reg_write_sel = Bus2IP_WrCE[5:0],
    slv_reg_read_sel  = Bus2IP_RdCE[5:0],
    slv_write_ack     = Bus2IP_WrCE[0] || Bus2IP_WrCE[1] || Bus2IP_WrCE[2] || Bus2IP_WrCE[3] || Bus2IP_WrCE[4] || Bus2IP_WrCE[5],
    slv_read_ack      = Bus2IP_RdCE[0] || Bus2IP_RdCE[1] || Bus2IP_RdCE[2] || Bus2IP_RdCE[3] || Bus2IP_RdCE[4] || Bus2IP_RdCE[5];

	
	always @ (posedge Bus2IP_Clk)
	begin
		if(adc_start_reg==0)  //if stop
		begin
			state<=5'b00001;
			data_available<=0;
			delay_counter<=0;
			clock_counter<=0;
			CS<=1;
			SCLK<=0;
			ip_clk_counter<=0;
		end
		else
		begin
			case(state)
				5'b00001:
				begin		
					data_available<=0;		
					if(ip_clk_counter==0)
					begin
						spi_data<=0;
						CS<=0;
						SCLK<=0;
						clock_counter<=0;
						delay_counter<=0;
						state<=5'b00010;
					end
					if(ip_clk_counter>=clk_divider_reg)
						ip_clk_counter<=0;
					else
					  ip_clk_counter<=ip_clk_counter+1;
				end
				5'b00010:
				begin
					if(ip_clk_counter==0)
					begin
						SCLK<=~SCLK;
						clock_counter<=clock_counter+1;
						if(clock_counter==15)
						begin	
							clock_counter<=0;
							state<=5'b00100;
						end
					end
					if(ip_clk_counter>=clk_divider_reg)
						ip_clk_counter<=0;
					else
					  ip_clk_counter<=ip_clk_counter+1;
				end
				
				5'b00100:
				begin
					if(ip_clk_counter==0)
					begin
						SCLK<=~SCLK;
						clock_counter<=clock_counter+1;
					
						if(SCLK==0) //right before rising edge
						begin
							spi_data<=(spi_data<<1)+MISO;
						end
						
						if(clock_counter==30)
						begin
							CS<=1;
							data_available<=1;						
							if(delay_reg==0)
								state<=5'b00001;
							else
								state<=5'b01000;
						end
					end
					if(ip_clk_counter>=clk_divider_reg)
						ip_clk_counter<=0;
					else
					  ip_clk_counter<=ip_clk_counter+1;
						
				end
				
				5'b01000:
				begin
					data_available<=0;
					if(ip_clk_counter==0)
					begin
						SCLK<=0;
						delay_counter<=delay_counter+1;
						if(delay_counter==delay_reg)
						begin
							CS<=0;						
							spi_data<=0;		
							clock_counter<=0;
							delay_counter<=0;
							state<=5'b00010;
						end
					end
					if(ip_clk_counter>=clk_divider_reg)
						ip_clk_counter<=0;
					else
					  ip_clk_counter<=ip_clk_counter+1;
				end
			endcase
		end
	end

  // implement slave model register(s)
  always @( posedge Bus2IP_Clk )
    begin
      if ( Bus2IP_Resetn == 1'b0 )
        begin
          adc_start_reg <= 0;
          delay_reg <= 0;
          clk_divider_reg <= 0;
          intr_status_reg <= 0;
          intr_enable_reg <= 0;
          adc_data_reg <= 0;
        end
      else
			begin
        case ( slv_reg_write_sel )
          6'b100000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                adc_start_reg[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          6'b010000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                delay_reg[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          6'b001000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                clk_divider_reg[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          6'b000100 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                intr_status_reg[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          6'b000010 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                intr_enable_reg[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          6'b000001 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                adc_data_reg[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          default : begin
            adc_start_reg <= adc_start_reg;
            delay_reg <= delay_reg;
            clk_divider_reg <= clk_divider_reg;
						if(data_available==1)
						begin
							intr_status_reg <= 1;
							IP_INTR<=intr_enable_reg;
							adc_data_reg<=spi_data;
						end
						else
						begin
							intr_enable_reg <= intr_enable_reg;
							adc_data_reg <= adc_data_reg;
						end
                    end
        endcase
			end  // SLAVE_REG_WRITE_PROC

  // implement slave model register read mux


      // SLAVE_REG_READ_PROC
			case ( slv_reg_read_sel )
        6'b100000 : IP2Bus_Data <= adc_start_reg;
        6'b010000 : IP2Bus_Data <= delay_reg;
        6'b001000 : IP2Bus_Data <= clk_divider_reg;
        6'b000100 : 
					begin
						IP2Bus_Data <= intr_status_reg;
						
						//clear interrupt and interrupt status register on read
						intr_status_reg<=0;
						IP_INTR<=0;
					end
        6'b000010 : IP2Bus_Data <= intr_enable_reg;
        6'b000001 : IP2Bus_Data <= adc_data_reg;
        default : IP2Bus_Data <= 0;
      endcase
			
			IP2Bus_WrAck = slv_write_ack;
			IP2Bus_RdAck = slv_read_ack;
			IP2Bus_Error = 0;
			
    end 

endmodule
