using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.Requests
{
    public class ProductUpdateRequest
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public byte[] Image { get; set; }
        public string Description { get; set; }


    }
}
