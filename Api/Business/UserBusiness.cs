using System.Security.Cryptography;
using System.Text;
using Ecomonitor.Business.Interfaces;
using Ecomonitor.Domain;
using Ecomonitor.Repository.Interfaces;

namespace Ecomonitor.Business
{
    public class UserBusiness : IUserBusiness
    {
        private readonly IUserRepository _userRepository;

        public UserBusiness(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<int> CreateUser(UserDto user)
        {
            user.Senha = HashPassword(user.Senha);

            var result = await _userRepository.Create(user);
            return result;
        }

        private string HashPassword(string password)
        {
            if (string.IsNullOrEmpty(password))
            {
                throw new ArgumentException("A senha não pode ser nula ou vazia.", nameof(password));
            }

            using var sha256 = SHA256.Create();
            var passwordBytes = Encoding.UTF8.GetBytes(password); 
            var hashBytes = sha256.ComputeHash(passwordBytes);
            return Convert.ToHexString(hashBytes);
        }
    }
}
