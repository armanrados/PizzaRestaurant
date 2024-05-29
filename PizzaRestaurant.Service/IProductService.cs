using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Service
{
    public interface IProductService : ICRUDService<Model.Product,ProductSearchObject, ProductInsertRequest, ProductUpdateRequest>
    {
    }
}
