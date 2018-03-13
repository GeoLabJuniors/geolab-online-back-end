using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Geo_Lab_Online.Models;

namespace Geo_Lab_Online.Controllers
{
    public class GeolabOnlineApiController : ApiController
    {
        GeolabOnlineDBDataContext db = new GeolabOnlineDBDataContext();
        public IEnumerable<User> GetUser()
        {
            return db.Users.ToList();
        }
        
    }
}
