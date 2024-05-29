using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PizzaRestaurant.Model;
using PizzaRestaurant.Model.Requests;
using PizzaRestaurant.Model.SearchObjects;
using PizzaRestaurant.Service;
using System.Text;

namespace PizzaRestaurant.Controllers
{
    public class UserController : BaseCRUDController<Model.User,UserSearchObject, UserInsertRequest, UserUpdateRequest>
    {

        public UserController(IUserService service) : base(service)
        {
            
        }

        [AllowAnonymous]
        public override Task<User> Insert([FromBody] UserInsertRequest request)
        {
            return base.Insert(request);
        }


        [HttpGet("Authenticate")]
        [AllowAnonymous]
        public async Task<User> Authenticate()
        {
            string authorization = HttpContext.Request.Headers["Authorization"];

            string encodedHeader = authorization["Basic ".Length..].Trim();

            Encoding encoding = Encoding.GetEncoding("iso-8859-1");
            string usernamePassword = encoding.GetString(Convert.FromBase64String(encodedHeader));

            int seperatorIndex = usernamePassword.IndexOf(':');

            return await ((IUserService)_service).Login(usernamePassword.Substring(0, seperatorIndex), usernamePassword[(seperatorIndex + 1)..]);
        }
    }
}
