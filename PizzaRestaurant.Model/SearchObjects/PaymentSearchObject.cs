using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.SearchObjects
{
    public class PaymentSearchObject : BaseSearchObject
    {
        public int? UserID { get; set; }
        public int? PaymentID { get; set; }
    }
}
