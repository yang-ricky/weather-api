# weather-api

# docker build -t weather:0.0.1 .

# docker run -it -p 8080:80 weather:0.0.1

# How to to remote debug?
  * sh ./clear.sh
  * docker run -it -p 8080:8080 -p 2345:2345 --name weather  weather:0.0.1 /bin/bash
  * input dotnet run --urls=http://*:8080 in command line
  * Click debug icon and select "RemoteDebug"
  * and then select Process
  * input http://localhost:8080/health
  * result can be seen in debug.jpg

# refinement
  * 如何优化image体积?
  * debug版本和非debug版本如何统一起来?