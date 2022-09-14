using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProductManager.Entities;
using ProductManager.RestApi.v1.Contracts;
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
        public async Task<GetProductsResponse> GetProduct([FromQuery]string name) 
        {
            var resp = new GetProductsResponse();

            var product = await _context.Products.FirstOrDefaultAsync(x => x.Name == name);
            if (product != null)
            {
                resp.Products.Add(new Contracts.Product
                {
                    Name = product.Name,
                    Description = product.Description,
                    Id = product.ID
                });
            }
            resp.OperationSuccess = true;
            return resp;
        }

        [HttpPost]
        public async Task<BaseResponse> CreateProduct([FromBody] CreateProductRequest request) 
        {
            _context.Products.Add(new Entities.Product
            {
                Description = request.Description,
                Name = request.Name
            });
            await _context.SaveChangesAsync();
            return new BaseResponse 
            { 
                OperationSuccess = true 
            };
        }

        [HttpPatch]
        public async Task<BaseResponse> EditProduct([FromBody] EditProductRequest request) 
        {
            var resp = new BaseResponse();
            var product = await _context.Products.FirstOrDefaultAsync(x => x.ID == request.ProductID);
            if (product != null)
            {
                product.Description = request.Description;
                product.Name = request.Name;
                await _context.SaveChangesAsync();
                resp.OperationSuccess = true;
            }
            else 
            {
                Response.StatusCode = 404;
                resp.Message = "Product not found"; 
            }
            return resp;
        }


        [HttpDelete]
        public async Task<BaseResponse> DeleteProduct([FromBody] DeleteProductRequest request) 
        {
            var resp = new BaseResponse();

            var product = await _context.Products.FirstOrDefaultAsync(x=>x.ID == request.ProductID);
            if (product != null)
            {
                _context.Products.Remove(product);
                await _context.SaveChangesAsync();
                resp.OperationSuccess = true;
            }
            else 
            {
                Response.StatusCode = 404;
                resp.Message = "Invalid Product ID";
            }

            return resp;
        }
    }
}
