using _Models.DAO;
using _Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ProductDetail(int id)
        {
          var  Product = new ProductDAO().getProduct(id);
            return View(Product);
        }
        public ActionResult Category(int id)
        {
            var ProductCategory = new ProductCategoryDAO().GetProductCategory(id);
            return View(ProductCategory);
        }
    }
}