using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Geo_Lab_Online.Models
{
    public class QuizModel
    {
        [AllowHtml]
        public string quiz { get; set; }
        public List<string> List { get; set; }
        public string correct { get; set; }
        public string LessonsTitel { get; set; }
    }
}