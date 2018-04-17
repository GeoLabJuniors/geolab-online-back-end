using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Geo_Lab_Online.Models
{
    public class LectureModel
    {
        public List<Lecture> OtherLecture = new List<Lecture>();
        public string _FirstName;
        public string _LastName;
        public string _UserBio;
        public string _UserMail;
        public string _UserPhoto;
    }
}