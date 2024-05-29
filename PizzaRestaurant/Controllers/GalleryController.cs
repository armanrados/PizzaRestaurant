using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using PizzaRestaurant.Service;

namespace PizzaRestaurant.Controllers
{
    public class GalleryController : BaseCRUDController<Model.Gallery,GallerySearchObject,GalleryInsertRequest,GalleryUpdateRequest>
    {
        public GalleryController(IGalleryService service) : base(service) 
        {
            
        }
    }
}
