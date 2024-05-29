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
    public class GalleryService : BaseCRUDService<Model.Gallery,Database.Gallery,GallerySearchObject,GalleryInsertRequest,GalleryUpdateRequest>, IGalleryService
    {
        public GalleryService(PizzaRestaurantContext db, IMapper mapper) : base(db,mapper)
        {
            
        }
        public override IQueryable<Gallery> AddInclude(IQueryable<Gallery> entity, GallerySearchObject? search = null)
        {
            if (search.IncludeUser == true)
            {
                entity = entity.Include(x => x.User);
            }
            return entity;
        }

        public override IQueryable<Gallery> AddFilter(IQueryable<Gallery> entity, GallerySearchObject? search = null)
        {
            var filterQuery = base.AddFilter(entity, search);

            if (!string.IsNullOrWhiteSpace(search?.Description))
            {
                filterQuery = filterQuery.Where(x => x.Description.ToLower().Contains(search.Description.ToLower()));
            }


            return filterQuery;
        }
    }
}
