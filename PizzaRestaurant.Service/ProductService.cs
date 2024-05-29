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
    public class ProductService : BaseCRUDService<Model.Product,Database.Product,ProductSearchObject, ProductInsertRequest, ProductUpdateRequest>, IProductService
    {
        public ProductService(PizzaRestaurantContext db , IMapper mapper) : base(db, mapper)
        {
            
        }
        public override IQueryable<Product> AddInclude(IQueryable<Product> entity, ProductSearchObject? search = null)
        {
           
            return entity;
        }

        public override IQueryable<Product> AddFilter(IQueryable<Product> entity, ProductSearchObject? search = null)
        {
            var filterQuery = base.AddFilter(entity, search);

            if (!string.IsNullOrWhiteSpace(search?.Name))
            {
                filterQuery = filterQuery.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
       


            return filterQuery;
        }

     
    }
}
