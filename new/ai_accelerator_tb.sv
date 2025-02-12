// ai_accelerator_tb.sv
module tb_ai_accelerator;

    reg clk;
    reg reset;
    reg [31:0] input_data;
    wire [31:0] output_data;
    wire valid;

    // Instantiate the AI Accelerator module
    ai_accelerator uut (
        .clk(clk),
        .reset(reset),
        .input_data(input_data),
        .output_data(output_data),
        .valid(valid)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    initial begin
        // Initialize inputs
        reset = 1;
        input_data = 32'h00000000;

        // Apply reset
        #10 reset = 0;

        // Stimulus for verification
        $display("Time\tInput\tOutput\tValid");
        for(int i = 0; i < 10; i++) begin
            input_data = i * 32'h00000001; // Increment input
            #10;
            $display("%0t\t%h\t%h\t%b", $time, input_data, output_data, valid);
        end

        // End simulation
        #50 $stop;
    end
endmodule

