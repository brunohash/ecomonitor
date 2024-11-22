using Ecomonitor.Domain;

namespace Ecomonitor.Repository.Interfaces
{
    public interface IUserRepository
    {
        Task<int> Create(UserDto user);
    }
}