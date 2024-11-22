using Ecomonitor.Business.Interfaces;
using Ecomonitor.Domain;
using Microsoft.AspNetCore.Mvc;

namespace Ecomonitor.Controllers 
{
    [Route("api/[controller]")]
    public class UserController(IUserBusiness userBusiness) : Controller
    {
        [HttpPost("create")]
        public async Task<IActionResult> Create([FromBody] UserDto user) 
        {
            var result = await userBusiness.CreateUser(user);

            if (result < 0)
            {
                return BadRequest("Ocorreu um erro ao criar o usuário!");
            }
            
            return Ok("Usuário criado com sucesso!");
        }
    }
}
