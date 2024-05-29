using AutoMapper;
using PizzaRestaurant.Model.Requests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaRestaurant.Service
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Database.User, Model.User>();
            CreateMap<UserInsertRequest, Database.User>();
            CreateMap<UserUpdateRequest, Database.User>();

            CreateMap<Database.Role, Model.Role>();
            CreateMap<Database.UserRole, Model.UserRole>();

            CreateMap<Database.Role, Model.Role>();
            CreateMap<RoleInsertUpdateRequest, Database.Role>();

            CreateMap<Database.Product, Model.Product>();
            CreateMap<ProductInsertRequest, Database.Product>();
            CreateMap<ProductUpdateRequest, Database.Product>();

            CreateMap<Database.Order, Model.Order>();
            CreateMap<OrderInsertRequest, Database.Order>();
            CreateMap<OrderUpdateRequest, Database.Order>();

            CreateMap<Database.OrderProduct, Model.OrderProduct>();


            CreateMap<Database.Payment, Model.Payment>();
            CreateMap<PaymentInsertUpdateRequest, Database.Payment>();

            CreateMap<Database.Gallery, Model.Gallery>();
            CreateMap<GalleryInsertRequest, Database.Gallery>();
            CreateMap<GalleryUpdateRequest, Database.Gallery>();

      






        }

    }
}
