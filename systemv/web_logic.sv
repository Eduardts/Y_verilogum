// web_logic.sv
module web_interface (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [7:0]  data_in,
    output logic [7:0]  data_out,
    output logic        valid
);

    // State definitions
    typedef enum logic [1:0] {
        IDLE,
        PROCESS,
        COMPLETE
    } state_t;

    state_t current_state, next_state;

    // Sequential logic
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Combinational logic
    always_comb begin
        case (current_state)
            IDLE: begin
                if (data_in != 0)
                    next_state = PROCESS;
                else
                    next_state = IDLE;
            end
            
            PROCESS: begin
                next_state = COMPLETE;
            end
            
            COMPLETE: begin
                next_state = IDLE;
            end
            
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always_comb begin
        case (current_state)
            PROCESS: begin
                data_out = data_in + 8'h20;  // Simple processing
                valid = 1'b0;
            end
            
            COMPLETE: begin
                data_out = data_in + 8'h20;
                valid = 1'b1;
            end
            
            default: begin
                data_out = 8'h00;
                valid = 1'b0;
            end
        endcase
    end
//throw tantrummmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
endmodule
