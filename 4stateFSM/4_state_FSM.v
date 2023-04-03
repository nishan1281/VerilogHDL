module fsm_4state (
  input clk,           // Clock input
  input rst,           // Reset input
  input in,            // Input to the FSM
  output reg out       // Output of the FSM
);

  parameter S0 = 2'd0;  // Define state S0 as 2'b00
  parameter S1 = 2'd1;  // Define state S1 as 2'b01
  parameter S2 = 2'd2;  // Define state S2 as 2'b10
  parameter S3 = 2'd3;  // Define state S3 as 2'b11
  
  reg [1:0] state;      // Declare state register
  
  always @(posedge clk) begin
    if (rst) begin
      state <= S0;      // Reset to initial state S0
    end else begin
      case (state)     // Perform state transition based on current state
        S0: begin     // If current state is S0
          if (in) begin
            state <= S1;  // Transition to state S1 on input high
          end else begin
            state <= S2;  // Transition to state S2 on input low
          end
        end
        S1: begin     // If current state is S1
          if (in) begin
            state <= S3;  // Transition to state S3 on input high
          end else begin
            state <= S0;  // Transition to state S0 on input low
          end
        end
        S2: begin     // If current state is S2
          if (in) begin
            state <= S0;  // Transition to state S0 on input high
          end else begin
            state <= S1;  // Transition to state S1 on input low
          end
        end
        S3: begin     // If current state is S3
          if (in) begin
            state <= S2;  // Transition to state S2 on input high
          end else begin
            state <= S3;  // Stay in current state on input low
          end
        end
      endcase
    end
  end
  
  always @(state) begin   // Output based on current state
    case (state)
      S0: out = 1'b0;      // Output low in state S0
      S1: out = 1'b1;      // Output high in state S1
      S2: out = 1'b0;      // Output low in state S2
      S3: out = 1'b1;      // Output high in state S3
    endcase
  end

endmodule
