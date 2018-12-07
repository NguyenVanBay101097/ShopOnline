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
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ProductDetail(int id)
        {
          var  Product = new ProductDAO().getProduct(id);
            ViewBag.Category= new ProductCategoryDAO().GetProductCategory(id);
            ViewBag.ProductsRelated = new ProductDAO().ProductsRelated(id);
            return View(Product);
        }
       
        public ActionResult Category(int id,int pageIndex=1, int pageSize=2)
        {
           
            var model = new ProductDAO().GetProductsRelated(id).ToPagedList(pageIndex,pageSize);
            
            ViewBag.ProductCategory = new ProductCategoryDAO().GetProductCategory(id);
            return View(model);
        }
    }
}