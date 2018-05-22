using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Geo_Lab_Online.Models
{
    public class AddLessonsModel
    {
        public int id { get; set; }
        public string Title { get; set; }
        [AllowHtml]
        public string Desc { get; set; }
        public string videoURl { get; set; }
        public string CodeEditor { get; set; }
        public String subjectid { get; set; }
        public int lessonselvl { get; set; }
    }
}