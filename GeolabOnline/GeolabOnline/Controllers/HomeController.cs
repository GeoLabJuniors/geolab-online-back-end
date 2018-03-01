using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GeolabOnline.Models;

namespace GeolabOnline.Controllers
{
    public class HomeController : Controller
    {
        GeolabDbDataContext db = new GeolabDbDataContext();
        public ActionResult Index()
        {
            return View();
        }
      
      
    }
}