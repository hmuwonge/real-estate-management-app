using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SawaTech.PropertyMini.Migrations
{
    /// <inheritdoc />
    public partial class Add_PropertyAmenity : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AppPropertyAmenities_AppProperties_PropertyId",
                table: "AppPropertyAmenities");

            migrationBuilder.DropIndex(
                name: "IX_AppPropertyAmenities_PropertyId",
                table: "AppPropertyAmenities");

            migrationBuilder.DropColumn(
                name: "PropertyId",
                table: "AppPropertyAmenities");

            migrationBuilder.CreateTable(
                name: "PropertyAmenity",
                columns: table => new
                {
                    PropertyId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    AmenityId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ExtraProperties = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PropertyAmenity", x => new { x.PropertyId, x.AmenityId });
                    table.ForeignKey(
                        name: "FK_PropertyAmenity_AppProperties_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "AppProperties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PropertyAmenity_AppPropertyAmenities_AmenityId",
                        column: x => x.AmenityId,
                        principalTable: "AppPropertyAmenities",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PropertyAmenity_AmenityId",
                table: "PropertyAmenity",
                column: "AmenityId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PropertyAmenity");

            migrationBuilder.AddColumn<Guid>(
                name: "PropertyId",
                table: "AppPropertyAmenities",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_AppPropertyAmenities_PropertyId",
                table: "AppPropertyAmenities",
                column: "PropertyId");

            migrationBuilder.AddForeignKey(
                name: "FK_AppPropertyAmenities_AppProperties_PropertyId",
                table: "AppPropertyAmenities",
                column: "PropertyId",
                principalTable: "AppProperties",
                principalColumn: "Id");
        }
    }
}
