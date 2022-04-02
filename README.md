# weather-api

# docker build -t weather:0.0.1 .

# docker run -it -p 8080:80 weather:0.0.1

# How to to remote debug?
  * docker-compose -f compose.yaml up
  * Click debug icon and select "RemoteDebug"
  * and then select Process
  * result can be seen in debug.jpg

# refinement
  * 如何优化image体积?
  * debug版本和非debug版本如何统一起来?