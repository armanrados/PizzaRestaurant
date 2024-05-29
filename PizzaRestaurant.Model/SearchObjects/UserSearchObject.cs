using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.SearchObjects
{
    public class UserSearchObject : BaseSearchObject
    {
        public string? Name { get; set; }
        public string? LastName { get; set; }
        public string? Username { get; set; }
        public bool? IncludeRoles { get; set; }
    }
}
