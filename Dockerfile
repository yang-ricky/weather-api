#!/bin/bash
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app

RUN rm -rf ./bin/
RUN rm -rf ./obj/debug

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0

RUN apt-get update && apt-get install -y curl

EXPOSE 80
WORKDIR /app

RUN curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l ~/vsdbg
RUN apt-get install -y procps

RUN chmod -R 777 /root/vsdbg

RUN cp -R /root/vsdbg/ ./vsdbg/
COPY --from=build-env /app/out .

CMD ["/bin/bash", "-c", "dotnet weather-api.dll"]
#ENTRYPOINT ["dotnet", "weather-api.dll"]
#ENTRYPOINT dotnet run --urls=http://*:5000