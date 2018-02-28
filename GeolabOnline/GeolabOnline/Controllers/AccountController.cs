using GeolabOnline.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GeolabOnline.Models
{
    public class AccountController : Controller
    {
        GeolabDbDataContext db = new GeolabDbDataContext();
        [HttpPost]
        public JsonResult Login(LoginModel model)
        {
            User loginUser=db.Users.Where(s => s.UserName == model.Name && s.Password == Hash(model.Password)).FirstOrDefault();

            return Json(1);
        }

        [HttpPost]
        public JsonResult Register(RegisterModel model)
        {
            if (
                model.FirstName.Trim() == "" ||
                model.LastName.Trim() == "" ||
                model.UserName.Trim() == "" ||
                model.PassowrdCon.Trim() == "" ||
                model.Password.Trim() == "" ||
                model.Mail.Trim() == "")
            {
                return Json(-1);
            }
            else
            {
                var passwordHash = Hash(model.Password);
                try
                {
                    User newUser = new User
                    {
                        Email = model.Mail,
                        UserName=model.UserName,
                        Password = passwordHash,
                        FirstName = model.FirstName,
                        LastName = model.LastName,
                        Status = "N",
                        CreateDate = model.CreateDate
                    };
                    db.Users.InsertOnSubmit(newUser);
                    db.SubmitChanges();
                    return Json(0);
                    //meilis gagzavnac unda daematos kide
                }
                catch (Exception) { return Json(1); }
            }
           // return Json(1);
        }


        public static string Hash(string text)
        {
            byte[] data = System.Security.Cryptography.MD5.Create()
                .ComputeHash(System.Text.Encoding.UTF8.GetBytes(text));
            string md5 = "";
            for (int i = 0; i < data.Length; i++)
            {
                md5 += data[i].ToString("x2");
            }
            return md5;

        }
    }
}