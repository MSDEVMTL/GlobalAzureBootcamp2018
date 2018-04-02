using Microsoft.ApplicationInsights;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Step1WebApp.Controllers
{
    public class ServiceController : Controller
    {
        // GET: Service
        public ActionResult Index()
        {
            try
            {
               // Services.SomeService.ThrowAnExceptionPlease();
                Services.SomeService.SomeWorkWithDependency();
            }
            catch (Exception ex)
            {
                var client = new TelemetryClient();
                client.TrackException(ex);
            }
            return View();

        }
    }
}