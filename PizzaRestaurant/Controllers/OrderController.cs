using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using PizzaRestaurant.Service;

namespace PizzaRestaurant.Controllers
{
    public class OrderController : BaseCRUDController<Model.Order,OrderSearchObject,OrderInsertRequest,OrderUpdateRequest>
    {
        public OrderController(IOrderService service) : base(service)
        {
            
        }
    }
}
