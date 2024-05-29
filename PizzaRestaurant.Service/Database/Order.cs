using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Service.Database
{
    public class Order
    {
        public int OrderID { get; set; }
        public int PaymentID { get; set; }
        public string? OrderNumber { get; set; }
        public int UserID { get; set; }
        public DateTime DateOfOrder { get; set; }
        public bool isCanceled { get; set; }
        public bool isShipped { get; set; }
        public virtual User User { get; set; }
        public virtual Payment Payment { get; set; }
        public virtual ICollection<OrderProduct> OrderProducts { get; set; }
    }
}
