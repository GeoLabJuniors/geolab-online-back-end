using Geo_Lab_Online.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Geo_Lab_Online.Controllers
{
    public class CourseController : Controller
    {
        GeolabOnlineDBDataContext db = new GeolabOnlineDBDataContext();
        // GET: Course
        public ActionResult Index()
        {
            List<Course> list = db.Courses.ToList();
            List<CoursModel> CourseList = new List<CoursModel>();

            foreach (var i in list)
            {
                CourseList.Add(new CoursModel()
                {
                    Desc = i.CourseDesc,
                    Id = i.ID,
                    Title = i.CourseTitle,
                    YoutubeLink = i.CourseVideoLink,
                    Direction = db.Directions.Where(a => a.ID == i.DirectionId).Select(a => a.DirectionTitle).FirstOrDefault().ToString()
                });
            }
            var s = db.Directions.ToList();
            ViewBag.list = new SelectList(s, "ID", "DirectionTitle");
            return View(CourseList);
        }
        [HttpPost]
        public ActionResult Add(CoursModel coursModel)
        {
            try {
            Course course = new Course()
            {
                CourseDesc = coursModel.Desc,
                CourseTitle = coursModel.Title,
                CourseVideoLink = coursModel.YoutubeLink,
                DirectionId = Int32.Parse(coursModel.Direction)
            };
            db.Courses.InsertOnSubmit(course);
            db.SubmitChanges();
            } catch(Exception ex) { return RedirectToAction("Index"); }
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id)
        {
            db.Courses.DeleteOnSubmit((db.Courses.Where(a => a.ID == id).FirstOrDefault()));
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
    }
}