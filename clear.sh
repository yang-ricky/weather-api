docker rm $(docker ps -a -q)
docker rmi $(docker images | grep 'weather')
docker build -f DockerfileDebug  -t weather:0.0.1 .