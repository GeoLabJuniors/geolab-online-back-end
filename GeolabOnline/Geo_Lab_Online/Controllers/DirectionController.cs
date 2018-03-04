using Geo_Lab_Online.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Geo_Lab_Online.Controllers
{
    public class DirectionController : Controller
    {
        GeolabOnlineDBDataContext db = new GeolabOnlineDBDataContext();
        // GET: Admin
        public ActionResult Index()
        {

            return View(db.Directions.ToList());
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddDirection(NewDirection direction)
        {
            try
            {
                Direction NewIcon = new Direction();
                string ext = Path.GetExtension(direction.File1.FileName);
                string name = RandomString32();
                string url = Server.MapPath("~/Content/Image/" + name + ext);


                NewIcon.DirectionTitle = direction.Name;
                NewIcon.DirectionDesc = direction.Desc;
                NewIcon.DirectionImage = name;

                NewIcon.DirectionImageExt = ext;
                db.Directions.InsertOnSubmit(NewIcon);
                db.SubmitChanges();
                direction.File1.SaveAs(url);

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.error = "დაფიქსირდა ხარვეზი ან ყველა ველი არ არის შევსებული "+ex.ToString();
                return View();
            }
        }
        public ActionResult Delete(int id)
        {
            db.Directions.DeleteOnSubmit((db.Directions.Where(a => a.ID == id).FirstOrDefault()));
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int id)
        {
            var t = db.Directions.Where(x => x.ID == id).FirstOrDefault();
            return View(t);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(NewDirection s)
        {


            Direction update_post = db.Directions.Where(x => x.ID == s.Id).FirstOrDefault();

            if (s.File1 is null)
            {
                update_post.DirectionTitle = s.Name;
                update_post.DirectionDesc = s.Desc;
                db.SubmitChanges();
            }
            else
            {
                string ext = Path.GetExtension(s.File1.FileName);
                string name = RandomString32();
                string url = Server.MapPath("~/Content/Image/" + name + ext);

                update_post.DirectionTitle = s.Name; update_post.DirectionDesc=s.Desc ; update_post.DirectionImage = name; update_post.DirectionImageExt = ext;
                db.SubmitChanges();
                s.File1.SaveAs(url);
            }

            return RedirectToAction("Index");

        }
        public ActionResult Details(int id)
        {
            return View(db.Directions.Where(s => s.ID == id).FirstOrDefault());
        }
        public static string RandomString32()
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var stringChars = new char[32];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            return new String(stringChars);
        }
    }
}