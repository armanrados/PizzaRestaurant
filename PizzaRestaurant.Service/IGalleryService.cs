using Microsoft.EntityFrameworkCore.Infrastructure;
using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Service
{
    public interface IGalleryService : ICRUDService<Model.Gallery,GallerySearchObject, GalleryInsertRequest, GalleryUpdateRequest>
    {
    }
}
