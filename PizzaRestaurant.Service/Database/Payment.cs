using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Service.Database
{
    public class Payment
    {
        public int PaymentID { get; set; }
        public double Total { get; set; }
        public DateTime DateOfPayment { get; set; }
        public string? NumberOfPayment { get; set; }
    }
}
