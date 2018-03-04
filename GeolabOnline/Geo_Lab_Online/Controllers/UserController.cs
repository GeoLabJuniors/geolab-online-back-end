using Geo_Lab_Online.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using Facebook;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Geo_Lab_Online.Controllers
{
    public class UserController : Controller
    {
        GeolabOnlineDBDataContext db = new GeolabOnlineDBDataContext();
        #region Login
        [HttpPost]
        public JsonResult Login(LoginModel model)
        {
            User loginUser = db.Users
                .Where(s => s.UserName == model.Name && s.Password == Hash(model.Password))
                .FirstOrDefault();
            if (loginUser.Status == "A")
            {
                Session["login_user"] = loginUser;
                return Json(1);
            }
            else
            {
                return Json(0);
            }
        }
        #endregion

        #region register
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
                        UserName = model.UserName,
                        Password = passwordHash,
                        FirstName = model.FirstName,
                        LastName = model.LastName,
                        Status = "N",
                        CreateDate = model.CreateDate
                    };
                    db.Users.InsertOnSubmit(newUser);
                    db.SubmitChanges();
                    try
                    {
                        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage
                        {
                            IsBodyHtml = false,
                            From = new System.Net.Mail.MailAddress("fido.osiashvili@gmail.com")
                        };
                        mail.To.Add(model.Mail);
                        mail.Subject = "რეგისტრაციის დადასტურება";
                        mail.Body = "გთხოვთ გადახვიდეთ ლინკზე საიტზე დარეგისტრირებისთვის localhost:52256/User/ActivationUser/" + newUser.ID;
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
                catch (Exception) { return Json(1); }
            }
            // return Json(1);
        }

        public ActionResult ActivationUser(string id)
        {
            int userid = Int32.Parse(id);
            var user = db.Users.Where(s => s.ID == userid).FirstOrDefault();
            user.Status = "A";
            db.SubmitChanges();
            return View();
        }

        #endregion

        #region facebook
        private Uri RediredtUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url)
                {
                    Query = null,
                    Fragment = null,
                    Path = Url.Action("FacebookCallback")
                };
                return uriBuilder.Uri;
            }
        }

        [AllowAnonymous]
        public ActionResult Facebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {

                client_id = "2145670919003082",
                client_secret = "cf543c7584be1c3f3f217e4f0bcadf39",
                redirect_uri = RediredtUri.AbsoluteUri,
                response_type = "code",
                scope = "email"

            });
            return Redirect(loginUrl.AbsoluteUri);
        }

        public ActionResult FacebookCallback(string code)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = "2145670919003082",
                client_secret = "cf543c7584be1c3f3f217e4f0bcadf39",
                redirect_uri = RediredtUri.AbsoluteUri,
                code = code

            });
            var accessToken = result.access_token;
            Session["AccessToken"] = accessToken;
            fb.AccessToken = accessToken;
            dynamic me = fb.Get("me?fields=link,first_name,id,currency,last_name,email,gender,locale,timezone,verified,picture,age_range");
            string email = me.email;

            string first_name = me.first_name;
            string last_name = me.last_name;
            User loginUser = db.Users
               .Where(s => s.UserName == email)
               .FirstOrDefault();
            if (loginUser == null)
            {
                User newUser = new User
                {
                    Email = email,
                    UserName = email,
                    //Password = passwordHash,
                    FirstName = first_name,
                    LastName = last_name,
                    Status = "F",
                    CreateDate = DateTime.Now
                };
                db.Users.InsertOnSubmit(newUser);
                db.SubmitChanges();
                Session["login_user"] = newUser;
                //var text = (string)Session["login_user"];
                FormsAuthentication.SetAuthCookie(email, false);
                return RedirectToAction("Index", "Home");
            }
            else if (loginUser.Status == "F")
            {
                Session["login_user"] = loginUser;
                // var text = Session["login_user"];
                return RedirectToAction("Index", "Home");
            }
            else { return RedirectToAction("Index", "Home"); }


        }
        #endregion

        #region Hash
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
        #endregion
    }
}