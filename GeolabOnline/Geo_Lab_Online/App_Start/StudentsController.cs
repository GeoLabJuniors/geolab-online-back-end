using Geo_Lab_Online.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Geo_Lab_Online.App_Start
{
    public class StudentsController : Controller
    {
        GeolabOnlineDBDataContext db = new GeolabOnlineDBDataContext();
        // GET: Students
        public ActionResult Index()
        {
            List<User> userList = db.Users.ToList();
            List<StudentModel> studentList = new List<StudentModel>();
            foreach(var i in userList)
            {
                String status;
                switch (i.Status)
                {
                    case "F":
                        status = "სოც. ქსელიდან";
                        break;
                    case "N":
                        status = "გასაქტიურებელი";
                        break;
                    case "A":
                        status = "აქტიური";
                        break;
                    default:
                        status = "არასანქცირებული სტატუსი";
                        break;
                }
                studentList.Add(new StudentModel()
                {
                     Email=i.Email, CreateDate=i.CreateDate.Value, FirstName=i.FirstName, ID=i.ID , LastName=i.LastName, Status = status

                });
            }

            return View(studentList);
        }
    }
}