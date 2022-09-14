using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ProductManager.RestApi.v1.Migrations
{
    public partial class InitialCreate : Migration
    {
        private readonly string _triggerTemplate = 
            @"CREATE TRIGGER {0} ON {1} AFTER {2}
            AS BEGIN
                INSERT INTO EventLog(ID, Description) VALUES(NEWID(), '{3}')
            END";

        protected override void Up(MigrationBuilder migrationBuilder)
        {

            #region EventLog_dbo

            migrationBuilder.CreateTable(
                name: "EventLog",
                columns: table => new
                {
                    ID = table.Column<Guid>(nullable: false, defaultValue: Guid.NewGuid()),
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
            migrationBuilder.CreateIndex(
                name: "IX_Products_Name",
                table: "Products",
                column: "Name",
                null,
                true);
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
                column: "Name", 
                null, 
                true);            
            
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


            string modifyProductsTrigger = string.Format(_triggerTemplate, "TR_Products_Modify", "Products", "INSERT, DELETE, UPDATE", "Product table has been modified.");
            string modifyProductVersionsTrigger = string.Format(_triggerTemplate, "TR_ProductVersions_Modify", "ProductVersions", "INSERT, DELETE, UPDATE", "Product Versions table has been modified.");
            
            migrationBuilder.Sql(modifyProductsTrigger);
            migrationBuilder.Sql(modifyProductVersionsTrigger);

            // This function could be called via this statment : select * from testFunc('-18', '-', 70, 80)

            string storedFunction = @"CREATE FUNCTION testFunc (@productName varchar(255), @productVersionName varchar(255), @minVolume int, @maxVolume int)
                                    RETURNS TABLE
                                    AS
                                    RETURN
                                    (
	                                    SELECT v.ID, p.NAME as ProductName, v.NAME as ProductVersionName, v.LENGTH, v.WIDTH, v.HEIGHT FROM PRODUCTS AS p
	                                    JOIN PRODUCTVERSIONS AS v ON p.ID = V.PRODUCTID 
	                                    WHERE p.NAME LIKE '%' + @productName + '%' AND 
	                                    v.NAME LIKE '%' +  @productVersionName + '%' AND 
	                                    (v.Length * v.Width * v.Height) > @minVolume AND
	                                    (v.Length * v.Width * v.Height) < @maxVolume
                                    )";
            migrationBuilder.Sql(storedFunction);


            Random rnd = new Random(DateTime.Now.Millisecond);
            for (int i = 0; i < 100; i++)
            {
                Guid productID = Guid.NewGuid();
                string insertProductCommand = $"INSERT INTO Products(ID, Name) values ('{productID}', '{productID.GetHashCode().ToString()}')";
                migrationBuilder.Sql(insertProductCommand);

                int version = rnd.Next(1, 5);
                for (int j = 0; j < version; j++) 
                {
                    Guid productVersionID = Guid.NewGuid();
                    string insertProductVersionCommand = $"INSERT INTO ProductVersions (ID, ProductID, Name, Width, Height, Length) VALUES ('{productVersionID}', '{productID}', '{productVersionID.GetHashCode()}', {rnd.Next(1,10)}, {rnd.Next(1, 10)}, {rnd.Next(1, 10)})";
                    migrationBuilder.Sql(insertProductVersionCommand);
                }
            }

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
