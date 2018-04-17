using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Mvc;
using Geo_Lab_Online.Models;


namespace Geo_Lab_Online.Filter
{
    public class AutorizationFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var user = (User)filterContext.HttpContext.Session["login_user"];

            if (user == null)
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary { { "controller", "Home" }, { "action", "Index" } });

               
            }
            else if (user.UserName != "admin")
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary { { "controller", "Home" }, { "action", "Index" } });
            }
            base.OnActionExecuting(filterContext);
        }
    }
}