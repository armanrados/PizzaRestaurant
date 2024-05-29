using Microsoft.EntityFrameworkCore;
using PizzaRestaurant.Service.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace PizzaRestaurant.Service.Database
{
    public class PizzaRestaurantContext : DbContext
    {
        public PizzaRestaurantContext(DbContextOptions<PizzaRestaurantContext> options) : base(options)
        {
            
        }
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserRole> UserRoles { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;

        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderProduct> OrderProducts { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<Gallery> Galleries { get; set; } = null!;
        public virtual DbSet<Payment> Payments { get; set; } = null!;
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Data Source=localhost;Initial Catalog=pizzarestaurantDB;Trusted_Connection=true;MultipleActiveResultSets=true;");
            }
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            var saltAdmin = UserService.GenerateSalt();
            var saltEmployee1 = UserService.GenerateSalt();
            var saltEmployee2 = UserService.GenerateSalt();
            var saltUser = UserService.GenerateSalt();
            var saltUser2 = UserService.GenerateSalt();



            modelBuilder.Entity<Role>().HasData(
                new Role { RoleID = 1, Name = "Administrator", Description = "Administrator" },
                new Role { RoleID = 2, Name = "Employee", Description = "Employee" }
                );

            modelBuilder.Entity<User>().HasData(
                new User { UserID = 1, Name = "Admin", LastName = "Admin", DateOfBirth = DateTime.Now, Email = "admin@gmail.com", Username = "admin",  PasswordSalt = saltAdmin, PasswordHash = UserService.GenerateHash(saltAdmin, "admin") },
                new User { UserID = 2, Name = "Employee1", LastName = "Employee1", DateOfBirth = DateTime.Now, Email = "employee1@gmail.com", Username = "employee1", PasswordSalt = saltEmployee1, PasswordHash = UserService.GenerateHash(saltEmployee1, "employee1") },
                new User { UserID = 3, Name = "User", LastName = "User", DateOfBirth = DateTime.Now, Email = "user@gmail.com", Username = "user", PasswordSalt = saltUser, PasswordHash = UserService.GenerateHash(saltUser, "user") },
                new User { UserID = 4, Name = "Employee2", LastName = "Employee2", DateOfBirth = DateTime.Now, Email = "employee2@gmail.com", Username = "employee2", PasswordSalt = saltEmployee2, PasswordHash = UserService.GenerateHash(saltEmployee2, "employee2") },
                new User { UserID = 5, Name = "User2", LastName = "User2", DateOfBirth = DateTime.Now, Email = "user2@gmail.com", Username = "user2", PasswordSalt = saltUser2, PasswordHash = UserService.GenerateHash(saltUser2, "user2") }

                );

            modelBuilder.Entity<UserRole>().HasData(
                new UserRole { UserRoleID = 1, UserID = 1, RoleID = 1 },
                new UserRole { UserRoleID = 2, UserID = 1, RoleID = 2 },
                new UserRole { UserRoleID = 3, UserID = 2, RoleID = 2 },
                new UserRole { UserRoleID = 4, UserID = 4, RoleID = 2 }
                );
         
            modelBuilder.Entity<Product>().HasData(
                new Product { ProductID = 1, Price = 12, Name = "Cappriciosa", Image = Convert.FromBase64String(Images.Images1[0]), Description = "Mozzarella cheese, Italian baked ham, mushroom, artichoke and tomato" },
                new Product { ProductID = 2, Price = 18, Name = "Al Tono", Image = Convert.FromBase64String(Images.Images1[1]), Description = "Flaked tuna, red onion, olives and arugula" },
                new Product { ProductID = 3, Price = 15, Name = "Vegetariana", Image = Convert.FromBase64String(Images.Images1[2]), Description = "Cherry tomatoes, artichoke, bell pepper, olives, red onion and some hidden (and optional) baby spinach" },
                new Product { ProductID = 4, Price = 18, Name = "Pepperoni", Image = Convert.FromBase64String(Images.Images1[3]), Description = "Tomato sauce, cheese, and pepperoni" },
                new Product { ProductID = 5, Price = 15, Name = "Quattro formagi", Image = Convert.FromBase64String(Images.Images1[4]), Description = "Blue or mature cheese, a soft cheese (such as emmental or gruyère) or a creamy cheese (such as robiola or stracchino), and a hard cheese (Parmesan or pecorino, grated)" },
                new Product { ProductID = 6, Price = 15, Name = "Napoli", Image = Convert.FromBase64String(Images.Images1[5]), Description = "Basic dough, raw tomatoes, fresh mozzarella cheese, fresh basil, and olive oil" },
                new Product { ProductID = 7, Price = 18, Name = "Picante", Image = Convert.FromBase64String(Images.Images1[6]), Description = "Spicy pepperoni crumb and hot chilli peppers" },
                new Product { ProductID = 8, Price = 15, Name = "Funghi", Image = Convert.FromBase64String(Images.Images1[7]), Description = "Button, shitake, portabella, cremini, and morel mushrooms" },
                new Product { ProductID = 9, Price = 12, Name = "Margherita", Image = Convert.FromBase64String(Images.Images1[8]), Description = "A bubbly crust, crushed San Marzano tomato sauce, fresh mozzarella and basil, a drizzle of olive oil, and a sprinkle of salt" },
                new Product { ProductID = 10, Price = 18, Name = "Prosciutto", Image = Convert.FromBase64String(Images.Images1[9]), Description = "Drizzle of olive oil, some fresh mozzarella, and a few pieces of prosciutto" }


                );

           

          
            
            modelBuilder.Entity<Gallery>().HasData(
                new Gallery { GalleryID = 1, UserID = 2, Description = "Pizza trio", Image = Convert.FromBase64String(Images.Images2[0]) },
                new Gallery { GalleryID = 2, UserID = 2, Description = "Oven pizza", Image = Convert.FromBase64String(Images.Images2[1]) },
                new Gallery { GalleryID = 3, UserID = 2, Description = "Enjoy pizza with your family", Image = Convert.FromBase64String(Images.Images2[2]) },
                new Gallery { GalleryID = 4, UserID = 2, Description = "Freshly made pizza", Image = Convert.FromBase64String(Images.Images2[3]) },
                new Gallery { GalleryID = 5, UserID = 2, Description = "Pizza made in an Italian oven style", Image = Convert.FromBase64String(Images.Images2[4]) },
                new Gallery { GalleryID = 6, UserID = 2, Description = "This view is better with a taste of our pizza", Image = Convert.FromBase64String(Images.Images2[5]) },
                new Gallery { GalleryID = 7, UserID = 2, Description = "Eat with classy style", Image = Convert.FromBase64String(Images.Images2[6]) },
                new Gallery { GalleryID = 8, UserID = 2, Description = "Pizza makes beer taste even better", Image = Convert.FromBase64String(Images.Images2[7]) }


                );

            

            modelBuilder.Entity<Payment>().HasData(
                new Payment { PaymentID = 1, NumberOfPayment = "pm_1NgBngFAJDjHi2xfTCgrQiBf", DateOfPayment = DateTime.Now, Total = 25 },
                new Payment { PaymentID = 2, NumberOfPayment = "pm_1Ng6aPFAJDjHi2xfCimfVrEb", DateOfPayment = DateTime.Now, Total = 36 }
              
                );

            modelBuilder.Entity<Order>().HasData(
                new Order { OrderID = 1, OrderNumber = Guid.NewGuid().ToString(), DateOfOrder = DateTime.Now, isCanceled = false, isShipped = true, UserID = 3, PaymentID = 1 },
                new Order { OrderID = 2, OrderNumber = Guid.NewGuid().ToString(), DateOfOrder = DateTime.Now, isCanceled = false, isShipped = true, UserID = 3, PaymentID = 2 }
             
                );

            modelBuilder.Entity<OrderProduct>().HasData(
                new OrderProduct { OrderProductID = 1, OrderID = 1, ProductID = 1, Amount = 2 },
                new OrderProduct { OrderProductID = 2, OrderID = 2, ProductID = 4, Amount = 1 }
               
                );
        }
    }
}
