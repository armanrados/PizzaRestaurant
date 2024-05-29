using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.Requests
{
    public class UserUpdateRequest
    {
        public string Name { get; set; }

        public string LastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Email { get; set; }

        public string? Role { get; set; }
        public int RoleID { get; set; }
    }
}
