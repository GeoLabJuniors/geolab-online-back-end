using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Geo_Lab_Online.Models
{
    public class RegisterModel
    {
        public string  UserName { get; set; }
        public string  Password { get; set; }
        public string PassowrdCon { get; set; }
        public string Mail { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime CreateDate = DateTime.Now;
    }
}