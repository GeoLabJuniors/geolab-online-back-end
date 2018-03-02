using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Facebook;
using System.Web.Mvc;
using System.Web.Security;

namespace Geo_Lab_Online.Controllers
{
    public class FacebokController : Controller
    {

        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

        private Uri RediredtUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
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
            string id = me.id;
            TempData["email"] = me.email;
            TempData["first_name"] = me.first_name;
            TempData["lastname"] = me.last_name;
            TempData["picture"] = me.picture.data.url;
            FormsAuthentication.SetAuthCookie(email, false);
            return RedirectToAction("Index", "Home");
        }
    }
}