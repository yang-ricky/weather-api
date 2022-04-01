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

EXPOSE 80
WORKDIR /app
COPY --from=build-env /app/out .
CMD ["/bin/bash", "-c", "dotnet weather-api.dll"]
#ENTRYPOINT ["dotnet", "weather-api.dll"]