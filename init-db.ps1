# Start the containers
docker compose up -d

# Wait for SQL Server to be ready
Start-Sleep -Seconds 15 #Adjust based on your needs

# Get the DB container name dynaimcally
# $dbContainerName = docker container ls --filter "label=com.docker.compose.project=sawatech" --filter "label=com.docker.compose.version=1" --format '{{.Names}}'
$dbContainerName = docker ps --filter "ancestor=mcr.microsoft.com/mssql/server" --format "{{.Names}}"

if (-not $dbContainerName) {
    
    Write-Error "MSSQL container not running. Check docker-compose setup"
     exit 1
}

# Create the database if not exists
$sql = "IF DB('SawaTechDb') IS NULL CREATE DATABASE SawaTechDb;"
Write-Host "Creating database..."
docker exec -i $dbContainerName /opt/mssql-tools/bin/sqlcmd `
 -S localhost -U sa -P YourStrong@Passw0rd -Q "$sql"

 # Optional: Run EF Core migrations
 #Make sure your host system has the EF CLI and .csproj is accessible
 Write-Host "Running EF Core migrations..."
 dotnet ef database update --project ./aspnet-core/src/SawaTech.PropertyMini.EframeworkCore
Write-Host "✅ Done!"