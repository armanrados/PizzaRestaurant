using AutoMapper;
using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using PizzaRestaurant.Service.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Service
{
    public class RoleService : BaseCRUDService<Model.Role, Database.Role,BaseSearchObject, RoleInsertUpdateRequest, RoleInsertUpdateRequest>, IRoleService
    {
        public RoleService(PizzaRestaurantContext db, IMapper mapper) : base(db, mapper)
        {
            
        }
    }
}
