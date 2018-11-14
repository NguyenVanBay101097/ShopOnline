using _Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _Models.DAO
{
    public class ProductDAO
    {
        private OnlineShop dt;
        public ProductDAO()
        {
            dt = new OnlineShop();
        }
        public Product getProduct(int id)
        {
            return dt.Products.Find(id);
        }
        public int SearchProductCategory(string searchString)
        {
            var ProductCategoryID = dt.ProductCategories.Where(x => x.CategoryName.ToLower() == searchString.ToLower()).FirstOrDefault().CategoryID;
            return ProductCategoryID;
        }
        public int Create(Product product)
        {
            try
            {
                dt.Products.Add(product);
                dt.SaveChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int Edit(Product product)
        {
            try
            {
                var editProduct = dt.Products.Find(product.ProductID);
               
                editProduct.Description = product.Description;
                editProduct.Detail = product.Detail;
                editProduct.Image = product.Image;
                editProduct.IncludeVAT = product.IncludeVAT;
                editProduct.MetaDescriptions = product.MetaDescriptions;
                editProduct.MetaKeywords = product.MetaKeywords;
                editProduct.MetaTitle = product.MetaTitle;
                editProduct.ModifiedBy = product.ModifiedBy;
                editProduct.ModifiedDate = product.ModifiedDate;
                editProduct.MoreImages = product.MoreImages;
                editProduct.Price = product.Price;
                editProduct.ProductName = product.ProductName;
                editProduct.PromotionPrice = product.PromotionPrice;
                editProduct.Quantity = product.Quantity;
                editProduct.Status = product.Status;
                editProduct.Tophot = product.Tophot;
                editProduct.Viewcount = product.Viewcount;
                editProduct.Warranty = product.Warranty;
                dt.SaveChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public void Remove(int id)
        {
            var productDeleted = dt.Products.Find(id);
            dt.Products.Remove(productDeleted);
            dt.SaveChanges();
        }
        public IEnumerable<Product> SelectAll()
        {
            return dt.Products.OrderBy(x => x.ProductID);
        }
        public IEnumerable<Product> SelectWithCondition(string searchString)
        {
            ProductDAO productDAO = new ProductDAO();
            var CategoryProductID = productDAO.SearchProductCategory(searchString);
            return dt.Products.Where(x => x.ProductName.Contains(searchString) ||
            x.ProductID.ToString()==searchString||x.CategoryID==CategoryProductID).OrderBy(x=>x.ProductID);
        }
        public bool ChangeStatus(int id)
        {
            var product = dt.Products.Find(id);
            product.Status = !product.Status;
            dt.SaveChanges();
            return product.Status;
        }
    }
}
