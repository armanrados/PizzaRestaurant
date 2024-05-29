using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.Requests
{
    public class PaymentInsertUpdateRequest
    {
        public double Total { get; set; }
        public DateTime DateOfPayment { get; set; }
        public string NumberOfPayment { get; set; }

    }
}
