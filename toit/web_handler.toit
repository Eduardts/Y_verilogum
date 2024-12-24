// web_handler.toit
import net
import http

main:
  server := http.Server
  server.handle "/api" :: handle_api
  server.listen "localhost" 8080

handle_api request response:
  response.headers["Content-Type"] = "application/json"
  response.write """{"status": "success"}"""
