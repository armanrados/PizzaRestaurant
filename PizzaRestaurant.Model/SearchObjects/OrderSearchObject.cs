using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.SearchObjects
{
    public class OrderSearchObject : BaseSearchObject
    {
        public string? OrderNumber { get; set; }
        public int? UserID { get; set; }
        public bool? IsShipped { get; set; }
        public bool? IsCanceled { get; set; }
        public bool? IncludeUser { get; set; }
        public bool? IncludeOrderProducts { get; set; }
        public bool? IncludePayment { get; set; }
    }
}
