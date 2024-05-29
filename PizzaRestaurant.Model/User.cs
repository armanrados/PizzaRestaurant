using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model
{
    public class User
    {
        public int UserID { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Email { get; set; }
        public string Username { get; set; }
        public string RoleNames => string.Join(", ", UserRoles?.Select(x => x.Role?.Name)?.ToList());

        public virtual ICollection<UserRole> UserRoles { get; set; }

    }
}
