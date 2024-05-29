using AutoMapper;
using Microsoft.EntityFrameworkCore;
using PizzaRestaurant.Model;
using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using PizzaRestaurant.Service.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Service
{
    public class UserService : BaseCRUDService<Model.User,Database.User, UserSearchObject,UserInsertRequest,UserUpdateRequest>, IUserService
    {
        public UserService(PizzaRestaurantContext db , IMapper mapper) : base(db,mapper)
        {
            
        }
        public override IQueryable<Database.User> AddInclude(IQueryable<Database.User> entity,UserSearchObject obj)
        {
            if(obj.IncludeRoles == true)
            {
                entity = entity.Include("UserRoles.Role");
            }
            return entity;
        }
        public override IQueryable<Database.User> AddFilter(IQueryable<Database.User> entity, UserSearchObject search)
        {
            var filterQuery = base.AddFilter(entity, search);

            if (!string.IsNullOrWhiteSpace(search.Name))
            {
                filterQuery = filterQuery.Where(x => x.Name.ToLower().StartsWith(search.Name.ToLower()));
            }

            if (!string.IsNullOrWhiteSpace(search.LastName))
            {
                filterQuery = filterQuery.Where(x => x.LastName.ToLower().StartsWith(search.LastName.ToLower()));
            }

            if (!string.IsNullOrWhiteSpace(search.Username))
            {
                filterQuery = filterQuery.Where(x => x.Username.StartsWith(search.Username));
            }
         

            return filterQuery;
        }
        public override async Task BeforeInsert(Database.User entity, UserInsertRequest insert)
        {

            var salt = GenerateSalt();
            var hash = GenerateHash(salt, insert.Password);
            entity.PasswordSalt = salt;
            entity.PasswordHash = hash;



        }
        public override async Task<Model.User> Insert(UserInsertRequest insert)
        {
            var entity = await base.Insert(insert);
            Database.UserRole userRole = new Database.UserRole();
            userRole.RoleID = insert.RoleID;
            userRole.UserID = entity.UserID;
            await _db.UserRoles.AddAsync(userRole);
            await _db.SaveChangesAsync();
            return entity;
        }
        public static string GenerateSalt()
        {
            RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider();
            var byteArray = new byte[16];
            provider.GetBytes(byteArray);


            return Convert.ToBase64String(byteArray);
        }

        public static string GenerateHash(string salt, string password)
        {
            byte[] src = Convert.FromBase64String(salt);
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] dst = new byte[src.Length + bytes.Length];

            System.Buffer.BlockCopy(src, 0, dst, 0, src.Length);
            System.Buffer.BlockCopy(bytes, 0, dst, src.Length, bytes.Length);

            HashAlgorithm algorithm = HashAlgorithm.Create("SHA1");
            byte[] inArray = algorithm.ComputeHash(dst);
            return Convert.ToBase64String(inArray);
        }
        public async Task<Model.User> Login(string username, string password)
        {
            var entity = await _db.Users.Include("UserRoles.Role").FirstOrDefaultAsync(x => x.Username == username);

            if (entity == null) { throw new Exception("User not found!"); }

            var hash = GenerateHash(entity.PasswordSalt, password);

            if (entity.PasswordHash != hash) { throw new Exception("Wrong password!"); }

            return _mapper.Map<Model.User>(entity);
        }
    }
}
