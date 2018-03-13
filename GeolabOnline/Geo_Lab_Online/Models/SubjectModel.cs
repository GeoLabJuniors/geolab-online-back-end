using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace Geo_Lab_Online.Models
{
    public class SubjectModel
    {
        public int Id { get; set; }
        public String Title { get; set; }
        public string Desc { get; set; }
        [Display(Name = "ვიდეოს ლინკი")]
        public string YoutubeLink { get; set; }
        public String Cours { get; set; }
        //public string func() { return "ss"; }
    }
}