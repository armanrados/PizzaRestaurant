using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.Requests
{
    public class OrderUpdateRequest
    {
        public bool IsShipped { get; set; }
        public bool IsCanceled { get; set; }
    }
}
