using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.Requests
{
    public class OrderInsertRequest
    {
        public int UserID { get; set; }
        public int PaymentID { get; set; }
        public List<OrderProductInsertRequest> ListOfProducts { get; set; }
    }
}
