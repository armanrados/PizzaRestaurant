using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.SearchObjects
{
    public class GallerySearchObject : BaseSearchObject
    {
        public string? Description { get; set; }
        public int? UserID { get; set; }
        public bool? IncludeUser {  get; set; }
    }
}
