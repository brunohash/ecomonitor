using Ecomonitor.Domain;

namespace Ecomonitor.Business.Interfaces
{
    public interface IUserBusiness
    {
        Task<int> CreateUser(UserDto user);
    }
}