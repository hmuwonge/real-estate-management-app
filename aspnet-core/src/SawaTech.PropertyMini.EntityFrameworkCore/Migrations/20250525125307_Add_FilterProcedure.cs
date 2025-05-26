using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SawaTech.PropertyMini.Migrations
{
    /// <inheritdoc />
    public partial class Add_FilterProcedure : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
  migrationBuilder.Sql(
                @"
                    CREATE PROCEDURE sp_FilterProperties
                @GovernorateId UNIQUEIDENTIFIER = NULL,
                @PropertyType UNIQUEIDENTIFIER = NULL,
                @MinPrice DECIMAL(18,2) = NULL,
                @MaxPrice DECIMAL(18,2) = NULL,
                @MinArea FLOAT = NULL,
                @MaxArea FLOAT = NULL,
                @Status NVARCHAR(50) = NULL, -- Optional: Add if needed
                @Rooms INT = NULL -- Optional: Add if needed
            AS
            BEGIN
                SELECT *
                FROM Properties
                WHERE (@GovernorateId IS NULL OR GovernorateId = @GovernorateId)
                AND (@PropertyType IS NULL OR PropertyType = @PropertyType)
                AND (@MinPrice IS NULL OR Price >= @MinPrice)
                AND (@MaxPrice IS NULL OR Price <= @MaxPrice)
                AND (@MinArea IS NULL OR Area >= @MinArea)
                AND (@MaxArea IS NULL OR Area <= @MaxArea)
                -- Optional: Add more conditions
                AND (@Status IS NULL OR Status = @Status)
                AND (@Rooms IS NULL OR Rooms = @Rooms)
            END
                "
            );
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }
    }
}
