using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SawaTech.PropertyMini.Migrations
{
    /// <inheritdoc />
    public partial class Add_MainImageToPropertyEntity : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "MainImage",
                table: "AppProperties",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "MainImage",
                table: "AppProperties");
        }
    }
}
