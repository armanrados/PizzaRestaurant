using AutoMapper;
using Microsoft.EntityFrameworkCore;
using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using PizzaRestaurant.Service.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Service
{
    public class OrderService : BaseCRUDService<Model.Order,Database.Order,OrderSearchObject, OrderInsertRequest, OrderUpdateRequest>, IOrderService
    {
        public OrderService(PizzaRestaurantContext db, IMapper mapper) : base(db,mapper)
        {
            
        }
        public override async Task<Model.Order> Insert(OrderInsertRequest insert)
        {
            var entity = await base.Insert(insert);

            foreach (var product in insert.ListOfProducts)
            {
                Database.OrderProduct Product = new Database.OrderProduct();

                Product.ProductID = product.ProductID;
                Product.Amount = product.Amount;
                Product.OrderID = entity.OrderID;

                await _db.AddAsync(Product);
            }

            await _db.SaveChangesAsync();

            return entity;
        }
        public override IQueryable<Order> AddInclude(IQueryable<Order> entity, OrderSearchObject search)
        {
            if (search.IncludeUser == true)
            {
                entity = entity.Include(x => x.User);
            }

            if (search.IncludeOrderProducts == true)
            {
                entity = entity.Include(x => x.User).Include(x => x.OrderProducts).ThenInclude(x => x.Product);
            }

            if (search.IncludePayment == true)
            {
                entity = entity.Include(x => x.Payment);
            }

            return entity;
        }
        public override IQueryable<Order> AddFilter(IQueryable<Order> entity, OrderSearchObject search)
        {
            if (!string.IsNullOrWhiteSpace(search.OrderNumber))
            {
                entity = entity.Where(x => x.OrderNumber.StartsWith(search.OrderNumber));
            }

            if (search.UserID.HasValue)
            {
                entity = entity.Where(x => x.UserID == search.UserID);
            }
            if (search.IsShipped.HasValue)
            {
                entity = entity.Where(x => x.isShipped == search.IsShipped);
            }

            if (search.IsCanceled.HasValue)
            {
                entity = entity.Where(x => x.isCanceled == search.IsCanceled);
            }

            return entity;
        }

        public override async Task BeforeInsert(Order entity, OrderInsertRequest insert)
        {
            entity.OrderNumber = Guid.NewGuid().ToString();
            entity.isCanceled = false;
            entity.isShipped = false;
            entity.UserID = insert.UserID;
            entity.DateOfOrder = DateTime.Now;
            entity.PaymentID = insert.PaymentID;
        }
    }
}
