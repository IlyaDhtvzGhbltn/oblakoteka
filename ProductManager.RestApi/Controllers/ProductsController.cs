using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProductManager.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductManager.RestApi.v1.Controllers
{
    [Route("api/v1/product")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        ProductManagerDbContext _context;
        public ProductsController(ProductManagerDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<string> GetProduct() 
        {
            _context.Products.FirstOrDefault();


            return null;
        } 
    }
}
