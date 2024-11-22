using Dapper;
using Ecomonitor.Domain;
using Ecomonitor.Repository.Interfaces;
using MySql.Data.MySqlClient;

namespace Ecomonitor.Repository
{
    public class HouseRepository : IHouseRepository
    {
        private readonly string? _connectionString;

        public HouseRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("DefaultConnection");
        }

        public async Task<int> Create(HouseDto house)
        {
            var result = 0;

            await using var connection = new MySqlConnection(_connectionString);
            await connection.OpenAsync();

            result = await connection.ExecuteAsync(
                "INSERT INTO casa (Id_Usuario, Nome, Created_At) VALUES (@Id_Usuario, @Nome, Now())",
                new { Id_Usuario = house.IdUsuario, Nome = house.Nome });

            return result;
        }

        public async Task<int> CreateProducts(ProductsDto product)
        {
            var result = 0;

            await using var connection = new MySqlConnection(_connectionString);
            await connection.OpenAsync();

            result = await connection.ExecuteAsync(
                "INSERT INTO aparelhos (Nome, Imagem, Consumo_Medio, Unidade_Medida, Observacoes, Id_Categoria) " +
                "VALUES (@Nome, @Imagem, @ConsumoMedio, @UnidadeMedida, @Observacoes, @IdCategoria)",
                new
                {
                    product.Nome, product.Imagem, product.ConsumoMedio,
                    product.UnidadeMedida, product.Observacoes, IdCategoria = product.Categoria
                });

            return result;
        }

        public async Task<int> CreateProductsIntoHouse(HouseProducts product)
        {
            var result = 0;

            await using var connection = new MySqlConnection(_connectionString);
            await connection.OpenAsync();

            result = await connection.ExecuteAsync(
                "INSERT INTO casa_aparelhos (Id_Casa, Id_Usuario, Id_Aparelho, Tempo_Consumo) " +
                "VALUES (@IdCasa, @IdUsuario, @IdAparelho, @TempoConsumo)",
                new
                {
                    IdCasa = product.IdHouse, IdUsuario = product.IdUser, IdAparelho = product.IdProduct, TempoConsumo = product.TimeConsumer
                });

            return result;
        }

        public async Task<IEnumerable<HouseDto>> GetHousesByUser(int userId)
        {
            await using var connection = new MySqlConnection(_connectionString);
            await connection.OpenAsync();

            var query = "SELECT Id, Nome, Id_Usuario AS IdUsuario, Created_At AS CreatedAt FROM casa WHERE Id_Usuario = @UserId";
            return await connection.QueryAsync<HouseDto>(query, new { UserId = userId });
        }

        public async Task<IEnumerable<ProductsDto>> GetProductsByHouse(int houseId)
        {
            await using var connection = new MySqlConnection(_connectionString);
            await connection.OpenAsync();

            var query = @"
                SELECT a.Id, a.Nome, a.Imagem, a.Consumo_Medio AS ConsumoMedio, a.Unidade_Medida AS UnidadeMedida,
                       a.Observacoes, a.Id_Categoria AS Categoria
                FROM aparelhos a
                INNER JOIN casa_aparelhos ca ON a.Id = ca.Id_Aparelho
                WHERE ca.Id_Casa = @HouseId";
            return await connection.QueryAsync<ProductsDto>(query, new { HouseId = houseId });
        }

        public async Task<IEnumerable<HouseProducts>> GetHouseProducts(int houseId)
        {
            await using var connection = new MySqlConnection(_connectionString);
            await connection.OpenAsync();

            var query = @"
                SELECT ca.Id_Casa AS IdHouse, ca.Id_Usuario AS IdUser, ca.Id_Aparelho AS IdProduct, ca.Tempo_Consumo AS TimeConsumer
                FROM casa_aparelhos ca
                WHERE ca.Id_Casa = @HouseId";
            return await connection.QueryAsync<HouseProducts>(query, new { HouseId = houseId });
        }
    }
}
