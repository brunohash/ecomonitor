using Ecomonitor.Business.Interfaces;
using Ecomonitor.Domain;
using Microsoft.AspNetCore.Mvc;

namespace Ecomonitor.Controllers 
{
    [Route("api/[controller]")]
    public class HouseController : Controller
    {
        private readonly IHouseBusiness _houseBusiness;

        public HouseController(IHouseBusiness houseBusiness)
        {
            _houseBusiness = houseBusiness;
        }

        [HttpPost("create")]
        public async Task<IActionResult> Post([FromBody] HouseDto house)
        {
            var result = await _houseBusiness.CreateHouse(house);

            if (result < 0)
            {
                return BadRequest("Ocorreu um erro ao criar a casa");
            }
            
            return Ok("Casa criada com sucesso");
        }

        [HttpPost("products")]
        public async Task<IActionResult> Post([FromBody] ProductsDto products)
        {
            var result = await _houseBusiness.CreateProducts(products);

            if (result < 0)
            {
                return BadRequest("Ocorreu um erro ao criar o produto");
            }
            
            return Ok("Produto criado com sucesso");
        }

        [HttpPost("productsintohouse")]
        public async Task<IActionResult> Post([FromBody] HouseProducts products)
        {
            var result = await _houseBusiness.CreateProductsIntoHouse(products);

            if (result < 0)
            {
                return BadRequest("Ocorreu um erro ao relacionar produto dentro de casa");
            }
            
            return Ok("Produto relacionado com sucesso");
        }

        [HttpGet("user/{userId}")]
        public async Task<IActionResult> GetHousesByUser(int userId)
        {
            var houses = await _houseBusiness.GetHousesByUser(userId);

            if (houses == null || !houses.Any())
            {
                return NotFound("Nenhuma casa encontrada para este usuário");
            }

            return Ok(houses);
        }

        [HttpGet("{houseId}/products")]
        public async Task<IActionResult> GetProductsByHouse(int houseId)
        {
            var products = await _houseBusiness.GetProductsByHouse(houseId);

            if (products == null || !products.Any())
            {
                return NotFound("Nenhum produto encontrado para esta casa");
            }

            return Ok(products);
        }

        [HttpGet("{houseId}/relationships")]
        public async Task<IActionResult> GetHouseProducts(int houseId)
        {
            var relationships = await _houseBusiness.GetHouseProducts(houseId);

            if (relationships == null || !relationships.Any())
            {
                return NotFound("Nenhum relacionamento encontrado para esta casa");
            }

            return Ok(relationships);
        }
    }
}
