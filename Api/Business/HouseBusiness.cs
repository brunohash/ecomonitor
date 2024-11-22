using Ecomonitor.Business.Interfaces;
using Ecomonitor.Domain;
using Ecomonitor.Repository.Interfaces;

namespace Ecomonitor.Business
{
    public class HouseBusiness : IHouseBusiness
    {
        private readonly IHouseRepository _houseRepository;

        public HouseBusiness(IHouseRepository houseRepository)
        {
            _houseRepository = houseRepository;
        }

        public async Task<int> CreateHouse(HouseDto house)
        {
            var result = await _houseRepository.Create(house);
            return result;
        }

        public async Task<int> CreateProducts(ProductsDto products)
        {
            var result = await _houseRepository.CreateProducts(products);
            return result;
        }

        public async Task<int> CreateProductsIntoHouse(HouseProducts products)
        {
            var result = await _houseRepository.CreateProductsIntoHouse(products);
            return result;
        }

        public async Task<IEnumerable<HouseDto>> GetHousesByUser(int userId)
        {
            return await _houseRepository.GetHousesByUser(userId);
        }

        public async Task<IEnumerable<ProductsDto>> GetProductsByHouse(int houseId)
        {
            return await _houseRepository.GetProductsByHouse(houseId);
        }

        public async Task<IEnumerable<HouseProducts>> GetHouseProducts(int houseId)
        {
            return await _houseRepository.GetHouseProducts(houseId);
        }
    }
}