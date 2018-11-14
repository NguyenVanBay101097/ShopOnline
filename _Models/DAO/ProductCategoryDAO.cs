using _Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _Models.DAO
{
    public class ProductCategoryDAO
    {
        private OnlineShop dt;
        public ProductCategoryDAO()
        {
            dt = new OnlineShop();
        }
        public ProductCategory GetProductCategory(int? id)
        {
            return dt.ProductCategories.Find(id);
        }
        public IEnumerable<ProductCategory> SelectAll()
        {
            return dt.ProductCategories.OrderBy(x => x.CategoryID);
        }
        public IEnumerable<ProductCategory> SelectWithCondition(string searchString)
        {
            return dt.ProductCategories.Where(x => x.CategoryName == searchString
            || x.CategoryID.Equals(searchString)).OrderBy(x => x.CategoryName);
        }
        public int Create(ProductCategory productCategory)
        {
            try
            {
                dt.ProductCategories.Add(productCategory);
                dt.SaveChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int Remove(int id)
        {
            try
            {
                var producdeleted = dt.ProductCategories.Find(id);
                dt.ProductCategories.Remove(producdeleted);
                dt.SaveChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int Edit(ProductCategory productCategory)
        {
            try
            {
                var productEditted = dt.ProductCategories.Find(productCategory.CategoryID);
                productEditted.CategoryName = productCategory.CategoryName;
                productEditted.CreateBy = productCategory.CreateBy;
                productEditted.CreateDate = DateTime.Now;
                productEditted.DisplayOrder = productCategory.DisplayOrder;
                productEditted.MetaDescriptions = productCategory.MetaDescriptions;
                productEditted.MetaKeywords = productCategory.MetaKeywords;
                productEditted.MetaTitle = productCategory.MetaTitle;
                productEditted.ParentCategoryID = productCategory.ParentCategoryID;
                productEditted.SeoTittle = productCategory.SeoTittle;
                productEditted.ShowOnHome = productCategory.ShowOnHome;
                productEditted.Status = productCategory.Status;
                dt.SaveChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public bool ChangeStatus(int id)
        {
            var productCategory = dt.ProductCategories.Find(id);
            productCategory.Status = !productCategory.Status;
            dt.SaveChanges();
            return productCategory.Status;
        }
    }
}
