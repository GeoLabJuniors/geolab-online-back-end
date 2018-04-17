using Geo_Lab_Online.Filter;
using Geo_Lab_Online.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Geo_Lab_Online.Controllers
{
    [AutorizationFilter]
    public class SubjectController : Controller
    {
        GeolabOnlineDBDataContext db = new GeolabOnlineDBDataContext();
        // GET: Subject
        public ActionResult Index()
        {

            List<Subject> list = db.Subjects.ToList();
            List<SubjectModel> SubjectList = new List<SubjectModel>();

            foreach (var i in list)
            {
                SubjectList.Add(new SubjectModel()
                {
                    Desc = i.SubjectDesc,
                    Id = i.ID,
                    Title = i.SubjectTitle,
                    YoutubeLink = i.SubjectVideoLink,
                  //   Cours = db.Courses.Where(a => a.ID == i.CourseID).Select(a => a.CourseTitle).FirstOrDefault().ToString()
                });
            }
            var s = db.Courses.ToList();
            ViewBag.list = new SelectList(s, "ID", "CourseTitle");
            return View(SubjectList);
        }

        [HttpPost]
        public ActionResult Add(SubjectModel subjectModel)
        {
            try
            {
                Subject subject = new Subject()
                {
                    SubjectDesc = subjectModel.Desc,
                    SubjectTitle = subjectModel.Title,
                    SubjectVideoLink = subjectModel.YoutubeLink,
                  //  CourseID = Int32.Parse(subjectModel.Cours)
                };
           
                db.Subjects.InsertOnSubmit(subject);
                db.SubmitChanges();
            }
            catch (Exception) { return RedirectToAction("Index"); }
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            db.Subjects.DeleteOnSubmit((db.Subjects.Where(a => a.ID == id).FirstOrDefault()));
            db.SubmitChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Details(int id)
        {
            return View(db.Subjects.Where(a => a.ID == id).FirstOrDefault());
        }

        public ActionResult Edit(int id)
        {
            var course = db.Subjects.Where(a => a.ID == id).FirstOrDefault();
            SubjectModel subjectModel = new SubjectModel()
            {
                Desc = course.SubjectDesc,
                Id = course.ID,
                Title = course.SubjectTitle,
                YoutubeLink = course.SubjectVideoLink,
                // Cours = course.Course.CourseTitle
            };
            var s = db.Courses.ToList();
            ViewBag.list = new SelectList(s, "ID", "CourseTitle");

            return View(subjectModel);
        }
        [HttpPost]
        public ActionResult Edit(SubjectModel model)
        {
            var course = db.Subjects.Where(a => a.ID == model.Id).FirstOrDefault();
            course.SubjectDesc = model.Desc;
            course.SubjectTitle = model.Title;
            course.SubjectVideoLink = model.YoutubeLink;
            //course.CourseID = Int32.Parse(model.Cours);
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
    }
}