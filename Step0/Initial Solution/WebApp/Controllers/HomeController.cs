using System;
using System.Web.Mvc;

namespace WebApp.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index()
		{
            ViewBag.Msg = "";

            return View();
		}


        public string DoSomethingLong()
        {
            var rnd = new Random();
            var waitFor = rnd.Next(10000, 16000);

            System.Threading.Thread.Sleep(waitFor);
            var msg = String.Format("You have waited {0}. Sorry about that.", waitFor);

            return msg;
        }

        public ActionResult Test()
        {
            var rnd = new Random();
            var waitFor = rnd.Next(500, 5000);

            System.Threading.Thread.Sleep(waitFor);
            var msg = String.Format("You have waited {0} seconds. Sorry about that.", Math.Round(double.Parse(waitFor.ToString()) / 1000, 1));

            ViewBag.Msg = msg;

            return View("Index");   
        }

        public ActionResult Error()
        {

            try {
                throw new Exception("As expected it crashes!");
            }
            catch (Exception ex) {
                ViewBag.Msg = ex.Message;
            }

            return View();
        }
    }
}