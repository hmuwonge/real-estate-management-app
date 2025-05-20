# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
copy . .
RUN dotnet restore
RUN dotnet PUBLISH -c Release -o /app

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "SawaTech.PropertyMini.HttpApi.Host.dll"]

# Publish stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS publish
WORKDIR /src
COPY --from=build /app .
RUN dotnet publish -c Release -o /app
