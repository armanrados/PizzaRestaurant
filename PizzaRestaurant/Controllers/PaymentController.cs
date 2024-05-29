using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using PizzaRestaurant.Service;

namespace PizzaRestaurant.Controllers
{
    public class PaymentController : BaseCRUDController<Model.Payment, PaymentSearchObject, PaymentInsertUpdateRequest, PaymentInsertUpdateRequest>
    {
        public PaymentController(IPaymentService service) : base(service)
        {
            
        }
    }
}
