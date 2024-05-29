﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Model.Requests
{
    public class UserInsertRequest
    {
     
        public string Name { get; set; }
      
        public string LastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Email { get; set; }
     
        public string Username { get; set; }
        public string Password { get; set; }

        public int RoleID { get; set; }
    }
}