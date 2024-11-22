using Ecomonitor.Domain;

namespace Ecomonitor.Business.Interfaces
{
    public interface IHouseBusiness
    {
        Task<int> CreateHouse(HouseDto user);
        Task<int> CreateProducts(ProductsDto products);
        Task<int> CreateProductsIntoHouse(HouseProducts products);
        Task<IEnumerable<HouseDto>> GetHousesByUser(int userId);
        Task<IEnumerable<ProductsDto>> GetProductsByHouse(int houseId);
        Task<IEnumerable<HouseProducts>> GetHouseProducts(int houseId);
    }
}