using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Geo_Lab_Online.Models;

namespace Geo_Lab_Online.Controllers
{
    public class HomeController : Controller
    {
        GeolabOnlineDBDataContext db = new GeolabOnlineDBDataContext();
        public ActionResult Index()
        {
            HomeIndexModel homeIndexModel = new HomeIndexModel();
            homeIndexModel.CourseList = db.Directions.ToList();
            homeIndexModel.SubjectList = db.Subjects.Take(6).ToList();
            homeIndexModel.LectureList = db.Lectures.Take(4).OrderBy(x => Guid.NewGuid()).ToList();
            return View(homeIndexModel);
        }


        #region SendMail
        [HttpPost]
        public JsonResult SendMail(MailModel model)
        {
            try
            {
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage
                {
                    IsBodyHtml = false,
                    From = new System.Net.Mail.MailAddress("fido.osiashvili@gmail.com")
                };
                mail.To.Add("fido.osiashvili@gmail.com");
                mail.Subject = "კონტაქტი";
                mail.Body =   model.Emial+"    " +model.TExt;
                System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient
                {
                    Host = "in-v3.mailjet.com",
                    Port = 587,
                    Credentials = new System.Net.NetworkCredential("93df9262791d5794a0e185d25f2f8698", "2be81bb40c3fc7a3eca443b76125b9c6"),
                    EnableSsl = false
                };
                smtpClient.Send(mail);
            }
            catch (Exception) { return Json(1); }
            return Json(0);

        }
#endregion


        public ActionResult Direction(int id)
        {
            var s = db.Directions.Where(a => a.ID == id).FirstOrDefault();
            DirectionModel directionModel = new DirectionModel();
            directionModel.DirectionDesc = s.DirectionDesc;
            directionModel.DirectionTitle = s.DirectionTitle;
            directionModel.DirectionImageExt = s.DirectionImageExt;
            directionModel.DirectionImage = s.DirectionImage;
            directionModel.ID = s.ID;
            directionModel.Courses = s.Courses.ToList();
            directionModel.subject = db.CourseSubjects.Where(a =>s.Courses.Select(v=>v.ID).ToList().Contains(a.CourseID.Value) ).Select(r=>r.Subject).ToList();
           
            //var list1 =
            //var list = db.Courses.Where(a => a.Direction.ID==directionModel.ID).ToList();
            //foreach (var kk in list) {
            //    directionModel.Courses.Add(new CoursModel { Id=kk.ID, Desc=kk.CourseDesc,Title=kk.CourseTitle });  }
            //DirectionModel ss = new DirectionModel() { Courses = list };
            return View(directionModel);
        }

        public ActionResult Subject() { return View(db.Subjects.ToList()); }
    }
}