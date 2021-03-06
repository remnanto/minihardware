/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg a,
    output reg b,
    output reg ci,
    input s,
    input co
  );
  
  
  
  reg rst;
  
  reg [27:0] M_counter_d, M_counter_q = 1'h0;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam IDLE_state = 4'd0;
  localparam CASE1_state = 4'd1;
  localparam CASE2_state = 4'd2;
  localparam CASE3_state = 4'd3;
  localparam CASE4_state = 4'd4;
  localparam CASE5_state = 4'd5;
  localparam CASE6_state = 4'd6;
  localparam CASE7_state = 4'd7;
  localparam CASE8_state = 4'd8;
  localparam MANUAL_state = 4'd9;
  
  reg [3:0] M_state_d, M_state_q = IDLE_state;
  wire [1-1:0] M_myBlinker_blink;
  blinker_2 myBlinker (
    .clk(clk),
    .rst(rst),
    .blink(M_myBlinker_blink)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    a = 1'h0;
    b = 1'h0;
    ci = 1'h0;
    io_led = 24'h000000;
    led = 8'h00;
    M_counter_d = M_counter_q + 1'h1;
    io_seg = 8'hff;
    io_sel = 4'hf;
    
    case (M_state_q)
      IDLE_state: begin
        a = 1'h0;
        b = 1'h0;
        ci = 1'h0;
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = CASE1_state;
          M_counter_d = 1'h0;
        end
        if (io_button[0+0-:1] == 1'h1) begin
          M_state_d = MANUAL_state;
          M_counter_d = 1'h0;
        end
      end
      CASE1_state: begin
        a = 1'h0;
        b = 1'h0;
        ci = 1'h0;
        led[0+0-:1] = 1'h1;
        if (s == 1'h0 & co == 1'h0) begin
          io_led[8+7-:8] = 8'h00;
        end else begin
          led = {4'h8{M_myBlinker_blink}};
        end
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = CASE2_state;
          M_counter_d = 1'h0;
        end
      end
      CASE2_state: begin
        a = 1'h0;
        b = 1'h0;
        ci = 1'h1;
        led[1+0-:1] = 1'h1;
        if (s == 1'h1 & co == 1'h0) begin
          io_led[0+7-:8] = 8'hff;
        end else begin
          led = {4'h8{M_myBlinker_blink}};
        end
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = CASE3_state;
          M_counter_d = 1'h0;
        end
      end
      CASE3_state: begin
        a = 1'h0;
        b = 1'h1;
        ci = 1'h0;
        led[2+0-:1] = 1'h1;
        if (s == 1'h1 & co == 1'h0) begin
          io_led[8+7-:8] = 8'hff;
        end else begin
          led = {4'h8{M_myBlinker_blink}};
        end
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = CASE4_state;
          M_counter_d = 1'h0;
        end
      end
      CASE4_state: begin
        a = 1'h0;
        b = 1'h1;
        ci = 1'h1;
        led[3+0-:1] = 1'h1;
        if (s == 1'h0 & co == 1'h1) begin
          io_led[8+7-:8] = 8'hff;
          io_led[0+7-:8] = 8'hff;
        end else begin
          led = {4'h8{M_myBlinker_blink}};
        end
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = CASE5_state;
          M_counter_d = 1'h0;
        end
      end
      CASE5_state: begin
        a = 1'h1;
        b = 1'h0;
        ci = 1'h0;
        led[4+0-:1] = 1'h1;
        if (s == 1'h1 & co == 1'h0) begin
          io_led[16+7-:8] = 8'hff;
        end else begin
          led = {4'h8{M_myBlinker_blink}};
        end
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = CASE6_state;
          M_counter_d = 1'h0;
        end
      end
      CASE6_state: begin
        a = 1'h1;
        b = 1'h0;
        ci = 1'h1;
        led[5+0-:1] = 1'h1;
        if (s == 1'h0 & co == 1'h1) begin
          io_led[16+7-:8] = 8'hff;
          io_led[0+7-:8] = 8'hff;
        end else begin
          led = {4'h8{M_myBlinker_blink}};
        end
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = CASE7_state;
          M_counter_d = 1'h0;
        end
      end
      CASE7_state: begin
        a = 1'h1;
        b = 1'h1;
        ci = 1'h0;
        led[6+0-:1] = 1'h1;
        if (s == 1'h0 & co == 1'h1) begin
          io_led[16+7-:8] = 8'hff;
          io_led[8+7-:8] = 8'hff;
        end else begin
          led = {4'h8{M_myBlinker_blink}};
        end
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = CASE8_state;
          M_counter_d = 1'h0;
        end
      end
      CASE8_state: begin
        a = 1'h1;
        b = 1'h1;
        ci = 1'h1;
        led[7+0-:1] = 1'h1;
        if (s == 1'h1 & co == 1'h1) begin
          io_led[16+7-:8] = 8'hff;
          io_led[8+7-:8] = 8'hff;
          io_led[0+7-:8] = 8'hff;
        end else begin
          led = {4'h8{M_myBlinker_blink}};
        end
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = IDLE_state;
          M_counter_d = 1'h0;
        end
      end
      MANUAL_state: begin
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = IDLE_state;
          M_counter_d = 1'h0;
        end
        a = io_dip[0+2+0-:1];
        b = io_dip[0+1+0-:1];
        ci = io_dip[0+0+0-:1];
        led = 8'hff;
        if (io_dip[0+2+0-:1]) begin
          io_led[16+7-:8] = 8'hff;
        end
        if (io_dip[0+1+0-:1]) begin
          io_led[8+7-:8] = 8'hff;
        end
        if (io_dip[0+0+0-:1]) begin
          io_led[0+7-:8] = 8'hff;
        end
        if (io_dip[0+2+0-:1] == 1'h0 && io_dip[0+1+0-:1] == 1'h0 && io_dip[0+0+0-:1] == 1'h0) begin
          if (s != 1'h0 && co != 1'h0) begin
            led = {4'h8{M_myBlinker_blink}};
          end
        end
        if (io_dip[0+2+0-:1] == 1'h0 && io_dip[0+1+0-:1] == 1'h0 && io_dip[0+0+0-:1] == 1'h1) begin
          if (s != 1'h1 && co != 1'h0) begin
            led = {4'h8{M_myBlinker_blink}};
          end
        end
        if (io_dip[0+2+0-:1] == 1'h0 && io_dip[0+1+0-:1] == 1'h1 && io_dip[0+0+0-:1] == 1'h0) begin
          if (s != 1'h1 && co != 1'h0) begin
            led = {4'h8{M_myBlinker_blink}};
          end
        end
        if (io_dip[0+2+0-:1] == 1'h0 && io_dip[0+1+0-:1] == 1'h1 && io_dip[0+0+0-:1] == 1'h1) begin
          if (s != 1'h0 && co != 1'h1) begin
            led = {4'h8{M_myBlinker_blink}};
          end
        end
        if (io_dip[0+2+0-:1] == 1'h1 && io_dip[0+1+0-:1] == 1'h0 && io_dip[0+0+0-:1] == 1'h0) begin
          if (s != 1'h1 && co != 1'h0) begin
            led = {4'h8{M_myBlinker_blink}};
          end
        end
        if (io_dip[0+2+0-:1] == 1'h1 && io_dip[0+1+0-:1] == 1'h0 && io_dip[0+0+0-:1] == 1'h1) begin
          if (s != 1'h0 && co != 1'h1) begin
            led = {4'h8{M_myBlinker_blink}};
          end
        end
        if (io_dip[0+2+0-:1] == 1'h1 && io_dip[0+1+0-:1] == 1'h1 && io_dip[0+0+0-:1] == 1'h0) begin
          if (s != 1'h0 && co != 1'h1) begin
            led = {4'h8{M_myBlinker_blink}};
          end
        end
        if (io_dip[0+2+0-:1] == 1'h1 && io_dip[0+1+0-:1] == 1'h1 && io_dip[0+0+0-:1] == 1'h1) begin
          if (s != 1'h1 && co != 1'h1) begin
            led = {4'h8{M_myBlinker_blink}};
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
