using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model
{
    public class Product
    {
        public int ProductID { get; set; }
        public string? Name { get; set; }
        public string Description { get; set; }
        public float Price { get; set; }
        public byte[] Image { get; set; }

    }
}
