using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.Requests
{
    public class OrderProductInsertRequest
    {
        public int ProductID { get; set; }
        public int Amount { get; set; }
    }
}
