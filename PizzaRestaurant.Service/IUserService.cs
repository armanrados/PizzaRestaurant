using Microsoft.EntityFrameworkCore.Infrastructure;
using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Service
{
    public interface IUserService : ICRUDService<Model.User,UserSearchObject,UserInsertRequest,UserUpdateRequest>
    {
        Task<Model.User> Login(string username, string password);
    }
}
