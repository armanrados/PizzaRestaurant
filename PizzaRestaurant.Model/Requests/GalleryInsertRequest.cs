using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.Requests
{
    public class GalleryInsertRequest
    {
        public byte[] Image { get; set; }
        public string Description { get; set; }
        public int UserID { get; set; }
    }
}
