using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model
{
    public class Gallery
    {
        public int GalleryID { get; set; }
        public string Description { get; set; }
        public byte[] Image { get; set; }
        public int UserID { get; set; }
        public virtual User User { get; set; }
    }
}
