using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SawaTech.PropertyMini.Migrations
{
    /// <inheritdoc />
    public partial class Add_IconColumnsToAmenityTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Quantity",
                table: "PropertyAmenity",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Icon",
                table: "AppPropertyNearbyPlaces",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Icon",
                table: "AppPropertyAmenities",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Quantity",
                table: "PropertyAmenity");

            migrationBuilder.DropColumn(
                name: "Icon",
                table: "AppPropertyNearbyPlaces");

            migrationBuilder.DropColumn(
                name: "Icon",
                table: "AppPropertyAmenities");
        }
    }
}
