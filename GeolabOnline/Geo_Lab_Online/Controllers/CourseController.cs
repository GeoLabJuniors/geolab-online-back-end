using Geo_Lab_Online.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Geo_Lab_Online.Controllers
{    //[AutorizationFilter]
    public class CourseController : Controller
    {
        GeolabOnlineDBDataContext db = new GeolabOnlineDBDataContext();
        // GET: Course

        public PartialViewResult Index1(string s)
        {
            List<Course> list = db.Courses.Where(a => a.DirectionId == 1005).ToList();
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
            return PartialView("View", CourseList);
        }
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
            try
            {
                Course course = new Course()
                {
                    CourseDesc = coursModel.Desc,
                    CourseTitle = coursModel.Title,
                    CourseVideoLink = coursModel.YoutubeLink,
                    DirectionId = Int32.Parse(coursModel.Direction)
                };
                db.Courses.InsertOnSubmit(course);
                db.SubmitChanges();
            }
            catch (Exception) { return RedirectToAction("Index"); }
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int id)
        {
            var course = db.Courses.Where(a => a.ID == id).FirstOrDefault();
            CoursModel coursModel = new CoursModel()
            {
                Desc = course.CourseDesc,
                Id = course.ID,
                Title = course.CourseTitle,
                YoutubeLink = course.CourseVideoLink,
                Direction = course.Direction.DirectionTitle
            };
            var s = db.Directions.ToList();
            ViewBag.list = new SelectList(s, "ID", "DirectionTitle");

            return View(coursModel);
        }
        [HttpPost]
        public ActionResult Edit(CoursModel model)
        {
            var course = db.Courses.Where(a => a.ID == model.Id).FirstOrDefault();
            course.CourseDesc = model.Desc;
            course.CourseTitle = model.Title;
            course.CourseVideoLink = model.YoutubeLink;
            course.DirectionId = Int32.Parse(model.Direction);
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Detail(int id)
        {
            return View(db.Courses.Where(a => a.ID == id).FirstOrDefault());
        }
        public ActionResult Delete(int id)
        {
            db.Courses.DeleteOnSubmit((db.Courses.Where(a => a.ID == id).FirstOrDefault()));
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
    }
}