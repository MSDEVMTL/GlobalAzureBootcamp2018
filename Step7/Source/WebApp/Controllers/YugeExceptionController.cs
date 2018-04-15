using System;
using System.Web.Mvc;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class YugeExceptionController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(YugeModel model)
        {
            if (string.IsNullOrEmpty(model.Value1) || string.IsNullOrEmpty(model.Value2))
            {
                return this.View();
            }

            throw new NotImplementedException();
        }
    }
}