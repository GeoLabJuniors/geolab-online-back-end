using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Geo_Lab_Online.Models
{
    public class NewDirection
    {
        public int Id { get; set; }
        public string Desc { get; set; }
        public HttpPostedFileBase File1 { get; set; }
        public string Name { get; set; }
    }
}