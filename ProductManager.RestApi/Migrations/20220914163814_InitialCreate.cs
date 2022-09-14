using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ProductManager.RestApi.v1.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {

            #region EventLog_dbo

            migrationBuilder.CreateTable(
                name: "EventLog",
                columns: table => new
                {
                    ID = table.Column<Guid>(nullable: false),
                    EventDate = table.Column<DateTime>(nullable: false, defaultValue: DateTime.Now),
                    Description = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EventLog", x => x.ID);
                });

            migrationBuilder.CreateIndex(
                name: "IX_EventLog_EventDate", 
                table: "EventLog", 
                column: "EventDate");
            #endregion
            #region Products_dbo

            migrationBuilder.CreateTable(
                name: "Products",
                columns: table => new
                {
                    ID = table.Column<Guid>(nullable: false),
                    Name = table.Column<string>(maxLength: 255, nullable: false),
                    Description = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Products", x => x.ID);
                });
            #endregion
            #region ProductVersions_dbo

            migrationBuilder.CreateTable(
                name: "ProductVersions",
                columns: table => new
                {
                    ID = table.Column<Guid>(nullable: false),
                    ProductID = table.Column<Guid>(nullable: false),
                    Name = table.Column<string>(maxLength: 255, nullable: false),
                    Description = table.Column<string>(nullable: true),
                    CreatingDate = table.Column<DateTime>(nullable: false, defaultValue: DateTime.Now),
                    Width = table.Column<float>(nullable: false),
                    Height = table.Column<float>(nullable: false),
                    Length = table.Column<float>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductVersions", x => x.ID);
                    table.ForeignKey(
                        name: "FK_ProductVersions_Products_ProductID",
                        column: x => x.ProductID,
                        principalTable: "Products",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ProductVersions_ProductID",
                table: "ProductVersions",
                column: "ProductID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductVersions_Name",
                table: "ProductVersions",
                column: "Name");            
            
            migrationBuilder.CreateIndex(
                name: "IX_ProductVersions_CreatingDate",
                table: "ProductVersions",
                column: "CreatingDate");            
            
            migrationBuilder.CreateIndex(
                name: "IX_ProductVersions_Width",
                table: "ProductVersions",
                column: "Width");            
            
            migrationBuilder.CreateIndex(
                name: "IX_ProductVersions_Height",
                table: "ProductVersions",
                column: "Height");            
            
            migrationBuilder.CreateIndex(
                name: "IX_ProductVersions_Length",
                table: "ProductVersions",
                column: "Length");
            #endregion


        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EventLog");

            migrationBuilder.DropTable(
                name: "ProductVersions");

            migrationBuilder.DropTable(
                name: "Products");
        }
    }
}
