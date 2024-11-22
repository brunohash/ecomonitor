using Ecomonitor.Domain;

namespace Ecomonitor.Repository.Interfaces
{
    public interface IHouseRepository
    {
        Task<int> Create(HouseDto user);
        Task<int> CreateProducts(ProductsDto product);
        Task<int> CreateProductsIntoHouse(HouseProducts product);

        Task<IEnumerable<HouseDto>> GetHousesByUser(int userId);
        Task<IEnumerable<ProductsDto>> GetProductsByHouse(int houseId);
        Task<IEnumerable<HouseProducts>> GetHouseProducts(int houseId);
    }
}