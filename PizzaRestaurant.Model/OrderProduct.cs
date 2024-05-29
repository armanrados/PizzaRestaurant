using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model
{
    public class OrderProduct
    {
        public int OrderProductID { get; set; }
        public int ProductID { get; set; }
        public int OrderID { get; set; }
        public int Amount { get; set; }
        public virtual Product Product { get; set; }
    }
}
