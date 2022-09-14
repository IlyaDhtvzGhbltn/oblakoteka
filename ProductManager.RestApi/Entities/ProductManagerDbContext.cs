using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using System;

namespace ProductManager.Entities
{
    public class ProductManagerDbContext : DbContext
    {
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductVersion> ProductVersions { get; set; }
        public virtual DbSet<EventLog> EventLog { get; set; }


        public ProductManagerDbContext(DbContextOptions<ProductManagerDbContext> opt): base(opt)
        {
            base.Database.EnsureDeleted();
            var migrator = base.Database.GetService<IMigrator>();
            migrator.Migrate();
        }
    }
}
