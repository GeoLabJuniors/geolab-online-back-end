using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Geo_Lab_Online.Models
{
    public class HomeIndexModel
    {
        public List<Direction> CourseList = new List<Direction>();
        public List<Lecture> LectureList = new List<Lecture>();
        public List<Subject> SubjectList = new List<Subject>();
       // public List<Course> CourseList { get; set; }
    }
}