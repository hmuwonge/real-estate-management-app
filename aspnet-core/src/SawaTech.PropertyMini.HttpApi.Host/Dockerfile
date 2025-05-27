# See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# This stage is used when running from VS in fast mode (Default for Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081


# This stage is used to build the service project
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["aspnet-core/NuGet.Config", "aspnet-core/"]
COPY ["aspnet-core/src/SawaTech.PropertyMini.HttpApi.Host/SawaTech.PropertyMini.HttpApi.Host.csproj", "aspnet-core/src/SawaTech.PropertyMini.HttpApi.Host/"]
COPY ["aspnet-core/src/SawaTech.PropertyMini.Application/SawaTech.PropertyMini.Application.csproj", "aspnet-core/src/SawaTech.PropertyMini.Application/"]
COPY ["aspnet-core/src/SawaTech.PropertyMini.Domain/SawaTech.PropertyMini.Domain.csproj", "aspnet-core/src/SawaTech.PropertyMini.Domain/"]
COPY ["aspnet-core/src/SawaTech.PropertyMini.Domain.Shared/SawaTech.PropertyMini.Domain.Shared.csproj", "aspnet-core/src/SawaTech.PropertyMini.Domain.Shared/"]
COPY ["aspnet-core/src/SawaTech.PropertyMini.Application.Contracts/SawaTech.PropertyMini.Application.Contracts.csproj", "aspnet-core/src/SawaTech.PropertyMini.Application.Contracts/"]
COPY ["aspnet-core/src/SawaTech.PropertyMini.EntityFrameworkCore/SawaTech.PropertyMini.EntityFrameworkCore.csproj", "aspnet-core/src/SawaTech.PropertyMini.EntityFrameworkCore/"]
COPY ["aspnet-core/src/SawaTech.PropertyMini.HttpApi/SawaTech.PropertyMini.HttpApi.csproj", "aspnet-core/src/SawaTech.PropertyMini.HttpApi/"]
RUN dotnet restore "./aspnet-core/src/SawaTech.PropertyMini.HttpApi.Host/SawaTech.PropertyMini.HttpApi.Host.csproj"
COPY . .
WORKDIR "/src/aspnet-core/src/SawaTech.PropertyMini.HttpApi.Host"
RUN dotnet build "./SawaTech.PropertyMini.HttpApi.Host.csproj" -c $BUILD_CONFIGURATION -o /app/build

# This stage is used to publish the service project to be copied to the final stage
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./SawaTech.PropertyMini.HttpApi.Host.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# This stage is used in production or when running from VS in regular mode (Default when not using the Debug configuration)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SawaTech.PropertyMini.HttpApi.Host.dll"]