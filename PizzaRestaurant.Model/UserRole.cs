﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model
{
    public class UserRole
    {
        public int UserRoleID { get; set; }
        public int RoleID { get; set; }
        public int UserID { get; set; }
        public virtual Role Role { get; set; }
    }
}
