using AutoMapper;
using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using PizzaRestaurant.Service.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace PizzaRestaurant.Service
{
    public class PaymentService : BaseCRUDService<Model.Payment,Database.Payment,PaymentSearchObject, PaymentInsertUpdateRequest, PaymentInsertUpdateRequest> , IPaymentService
    {
        public PaymentService(PizzaRestaurantContext db , IMapper mapper) : base(db, mapper)
        {
            
        }
        public override async Task BeforeInsert(Payment entity, PaymentInsertUpdateRequest insert)
        {
            entity.DateOfPayment = DateTime.Now;

        }
    }
}
