#!/bin/bash

# Compile SystemVerilog
iverilog -o systemv/sim systemv/web_logic.sv systemv/tb_web_logic.sv

# Build Toit
toit.compile toit/web_handler.toit -o toit/handler.snapshot

# Set up PHP server
php -S localhost:8000 -t public/
