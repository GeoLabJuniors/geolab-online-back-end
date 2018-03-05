﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Geo_Lab_Online.Models
{
    public class CoursModel
    {
        public int Id { get; set; }
        public String Title { get; set; }
        public string Desc { get; set; }
        [Display(Name ="ვიდეოს ლინკი")]
        public string YoutubeLink { get; set; }
        public String  Direction { get; set; }

    }
}