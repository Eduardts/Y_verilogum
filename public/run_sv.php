<?php
// run_sv.php

// Path to your SystemVerilog simulation executable
$sv_sim = "../systemv/sim";

// Execute SystemVerilog simulation
exec($sv_sim, $output, $return_var);

// Return simulation output
echo implode("\n", $output);
