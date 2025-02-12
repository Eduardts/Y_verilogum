# ai_smart_device.toit

import wifi
import http
import sensors

const DEVICE_ID = "smart-device-001"
const SERVER_URL = "http://api.example.com/update"

# Connect to Wi-Fi
wifi.connect("your-ssid", "your-password")

loop {
    # Read sensor data
    temperature = sensors.read_temperature()
    humidity = sensors.read_humidity()

    # Send data to cloud
    data = "{ \"device_id\": \"#{DEVICE_ID}\", \"temperature\": #{temperature}, \"humidity\": #{humidity} }"
    http.post(SERVER_URL, data)
    
    # Sleep for 10 seconds
    sleep(10000)
}

