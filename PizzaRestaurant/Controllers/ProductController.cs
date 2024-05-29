using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using PizzaRestaurant.Service;

namespace PizzaRestaurant.Controllers
{
    public class ProductController : BaseCRUDController<Model.Product, ProductSearchObject, ProductInsertRequest, ProductUpdateRequest>
    {
        public ProductController(IProductService service) : base(service) 
        {
            
        }
    }
}
