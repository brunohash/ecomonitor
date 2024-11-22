using Dapper;
using Ecomonitor.Domain;
using Ecomonitor.Repository.Interfaces;
using MySql.Data.MySqlClient;

namespace Ecomonitor.Repository
{
    public class UserRepository(IConfiguration config) : IUserRepository
    {
        private readonly string? _connectionString = config.GetConnectionString("DefaultConnection");

        public async Task<int> Create(UserDto user)
        {
            var result = 0;

            await using var connection = new MySqlConnection(_connectionString);
            
            await connection.OpenAsync();

            result = await connection.ExecuteAsync(
                "INSERT INTO Usuarios (Nome, Email, Senha, Created_At) VALUES (@Nome, @Email, @Senha, Now())",
                new { Nome = user.Nome, Email = user.Email, Senha = user.Senha });

            return result;
        }
    }
}