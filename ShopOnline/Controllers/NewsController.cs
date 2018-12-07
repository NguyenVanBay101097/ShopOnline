using _Models.DAO;
using _Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
namespace ShopOnline.Controllers
{
    public class NewsController : Controller
    {
        // GET: News
        public ActionResult Index(int id=0,int page=1,int pagesize=5)
        {
            NewsDAO newsDAO = new NewsDAO();
            var list = newsDAO.getContens(id).ToPagedList(page,pagesize);
            return View(list);
        }
        [ChildActionOnly]
        public ActionResult ListNews()
        {
            NewsDAO newsDAO = new NewsDAO();
            var list = newsDAO.ListAll();
            newsDAO.ChuyenDoi(list);
            return PartialView(list);
        }
    }
}