using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Geo_Lab_Online.Models;

namespace Geo_Lab_Online_Api.Controllers
{
    public class LectureController : ApiController
    {
        GeolabOnlineDBDataContext db = new GeolabOnlineDBDataContext();
        // GET api/<controller>
        public IEnumerable<String> Get()
        {
            List<Course> s = db.Courses.ToList();
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}