using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using PizzaRestaurant.Service;

namespace PizzaRestaurant.Controllers
{
    public class RoleController : BaseCRUDController<Model.Role, BaseSearchObject, RoleInsertUpdateRequest, RoleInsertUpdateRequest>
    {
        public RoleController(IRoleService service) : base(service)
        {
            
        }
    }
}
