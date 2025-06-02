using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SawaTech.PropertyMini.Migrations
{
    /// <inheritdoc />
    public partial class Add_AddExtraColumnsToTablesNearbyAmenities : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Icon",
                table: "AppNearbyPlaces",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Icon",
                table: "AppNearbyPlaces");
        }
    }
}
