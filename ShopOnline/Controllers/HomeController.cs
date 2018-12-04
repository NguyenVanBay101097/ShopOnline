using _Models.DAO;
using _Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            TempData["slides"] = new SlideDAO().SelectAll().ToList();
            TempData["listnewproduct"] = new ProductDAO().ListNewProduct(4);
            TempData["listhotproduct"] = new ProductDAO().ListHotProduct(4);
            return View();
        }
        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            MenuDAO menuDAO = new MenuDAO();
            var menus = menuDAO.ListMenu(24);
            return PartialView(menus);
        }
        [ChildActionOnly]
        public ActionResult TopMenu()
        {
            MenuDAO menuDAO = new MenuDAO();
            var menus = menuDAO.ListMenu(23);
            return PartialView(menus);  
        }
    }

}