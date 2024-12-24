<?php
// index.php
header('Content-Type: text/html; charset=utf-8');
?>

<!DOCTYPE html>
<html>
<head>
    <title>SystemVerilog Web Interface</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f0f0f0;
        }
        .sv-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .sv-output {
            font-family: monospace;
            background-color: #f8f8f8;
            padding: 10px;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <div class="sv-container">
        <h1>SystemVerilog Web Interface</h1>
        <div id="sv-output" class="sv-output">
            <!-- SystemVerilog output will be displayed here -->
        </div>
        <button onclick="runSimulation()">Run SystemVerilog Simulation</button>
    </div>

    <script>
        async function runSimulation() {
            try {
                const response = await fetch('run_sv.php');
                const data = await response.text();
                document.getElementById('sv-output').innerHTML = data;
            } catch (error) {
                console.error('Error:', error);
            }
        }
    </script>
</body>
</html>
