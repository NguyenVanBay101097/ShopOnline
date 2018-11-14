using _Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace _Models.DAO
{
    public class ContentDAO
    {
        private OnlineShop dt;
        public ContentDAO()
        {
            dt = new OnlineShop();
        }
        public void Remove(int IDnguoiDungCanXoa)
        {
            var Content = dt.Contents.Find(IDnguoiDungCanXoa);
            dt.Contents.Remove(Content);
            dt.SaveChanges();
        }
        public bool ChangeStatus(int id)
        {
            var content = dt.Contents.Find(id);
            content.Status = !content.Status;
            dt.SaveChanges();
            return content.Status;
        }
        public int Sua(Content contentEdit)
        {
            
                var contentEditted = dt.Contents.Find(contentEdit.ContentID);
            contentEditted.ContentName = contentEdit.ContentName;
                dt.SaveChanges();
                return 1;
           
        }
        public int ThemContent(Content content)
        {
            dt.Contents.Add(content);
            dt.SaveChanges();
            return content.ContentID;
        }
        public Content TimContent(int id)
        {
            var ContentCanTim = dt.Contents.Find(id);
            return ContentCanTim;
        }
        public IEnumerable<Content> listAll()
        {
            var DanhSach = dt.Contents.OrderBy(x=>x.ContentID);
            return DanhSach;

        }
        public IEnumerable<Content> ListAllWithCondition(string SearchContent)
        {
            var DanhSach = dt.Contents.Where(x => x.Status == true&&x.ContentName.Contains(SearchContent)||
             x.Status == true && x.Description.Contains(SearchContent)).OrderBy(x => x.ContentID);
            return DanhSach;

        }
    }
}
