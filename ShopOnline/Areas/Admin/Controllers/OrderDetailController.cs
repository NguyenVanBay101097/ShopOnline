using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _Models.DAO;
using _Models.EF;
using PagedList;
namespace ShopOnline.Areas.Admin.Controllers
{
    public class OrderDetailController : BaseController
    {
        // GET: Admin/OrderDetail
        public ActionResult Index(int id,int page=1,int pagesize=2)
        {
            OrderDetailDAO orderDetail = new OrderDetailDAO();
            var list = orderDetail.ListAll(id).ToPagedList(page,pagesize);
            ViewBag.Tong = orderDetail.TongTien(id);
            
            return View(list);
        }
    }
}