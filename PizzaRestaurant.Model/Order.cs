using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model
{
    public class Order
    {
        public int OrderID { get; set; }
        public int UserID { get; set; }
        public int PaymentID { get; set; }
        public DateTime DateOfOrder { get; set; }
        public string OrderNumber { get; set; }
        public bool IsCanceled { get; set; } = false;
        public bool isShipped { get; set; } = false;
        public float TotalPrice => OrderProducts.Sum(x => x.Product.Price * x.Amount);
        public string OrderProductsi => string.Join(", ", OrderProducts?.Select(x => $"{x.Product?.Name} x{x.Amount}")?.ToList());

        public virtual User User { get; set; }
        public virtual Payment Payment { get; set; }
        public virtual ICollection<OrderProduct> OrderProducts { get; set; }


    }
}
