using _Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _Models.DAO
{
    public class NewsDAO
    {
        public static string msgerror = "";
        private OnlineShop dt = null;
        public NewsDAO()
        {
            dt = new OnlineShop();
        }
        public bool ChangeStatus(int newsid)
        {
            var news = dt.News.Find(newsid);
            news.Status = !news.Status;
            dt.SaveChanges();
            return news.Status;
        }
        public int Edit(About about)
        {
            try
            {
                var aboutEditted = dt.Abouts.Find(about.AboutID);
                aboutEditted.AboutName = about.AboutName;
                aboutEditted.Description = about.Description;
                aboutEditted.Detail = about.Detail;
                aboutEditted.MetaDescriptions = about.MetaDescriptions;
                aboutEditted.MetaKeywords = about.MetaKeywords;
                aboutEditted.MetaTitle = about.MetaTitle;
                aboutEditted.ModifiedBy = about.ModifiedBy;
                aboutEditted.ModifiedDate = about.ModifiedDate;
                about.Status = about.Status;
                dt.SaveChanges();
                return 1;
            }
            catch
            {
                return 0;
            }

        }
        public News getNews(int id)
        {
            return dt.News.Find(id);
        }
        public int EditNews(News newsEdit)
        {
            var editted = dt.News.Find(newsEdit.NewsID);
            if (editted != null)
            {
                editted.NewsName = newsEdit.NewsName;
                editted.DisplayOrder = newsEdit.DisplayOrder;
                editted.MetaDescriptions = newsEdit.MetaDescriptions;
                editted.MetaKeywords = newsEdit.MetaKeywords;
                editted.MetaTitle = newsEdit.MetaTitle;
                editted.ParentNewsID = newsEdit.ParentNewsID;
                editted.SeoTittle = newsEdit.SeoTittle;
                editted.ShowOnHome = newsEdit.ShowOnHome;
                editted.Status = newsEdit.Status;
                editted.ModifiedDate = DateTime.Now.ToString();
                editted.ModifiedBy = newsEdit.ModifiedBy;
                dt.SaveChanges();
                return 1;
            }
            else { return 0; }
        }
        public string Xoa(int IDNewsCanXoa)
        {
            var NewsDeleting = dt.News.Find(IDNewsCanXoa);
            string NewsNameSelected = NewsDeleting.NewsName;
            dt.News.Remove(NewsDeleting);
            dt.SaveChanges();
            return NewsNameSelected;
        }
        public int AddNews(News news)
        {
            try
            {
                
                dt.News.Add(news);
                dt.SaveChanges();
                return 1;
            }
            catch (Exception e)
            {
                msgerror = e.Message;
                return 0;
            }
        }
        public List<News> ListAll()
        {
            var list = dt.News.ToList();
            return dt.News.ToList();
        }
        public string TenNews(int? ParentNewsID)
        {
            if (ParentNewsID == null) return "Không nằm trong loại nào cả";
            var ParentNews = dt.News.Find(ParentNewsID);
            return ParentNews.NewsName;
        }

    }
}
