using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Geo_Lab_Online.Models
{
    public class DirectionModel
    {
        public int ID { get; set; }
        public String DirectionTitle { get; set; }
        public string DirectionImage { get; set; }
        public string DirectionDesc { get; set; }

        public List<Course> Courses { get; set; }
        public List<Subject> subject { get; set; }

        public string DirectionImageExt { get; set; }

        public string DirectionDescMini { get; set; }
    }
}