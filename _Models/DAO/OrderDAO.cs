using _Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _Models.DAO
{
    public class OrderDAO
    {
        OnlineShop dt = null;
        public OrderDAO()
        {
            dt = new OnlineShop();
        }
        public Product GetProduct(int id)
        {
            return dt.Products.SingleOrDefault(x => x.ProductID == id);
        }
        public bool ChangeStatus(int id)
        {
            var order = dt.Orders.Find(id);
            order.status = !order.status;
            dt.SaveChanges();
            return order.status;
        }
        public IEnumerable<Order> ListAll()
        {
            return dt.Orders.OrderBy(x => x.OrderID);
        }
        public IEnumerable<Order> ListAllWithCondition(string search)
        {
            return dt.Orders.OrderBy(x => x.OrderID).Where(x=>x.OrderID==int.Parse(search));
        }
        public Order GetOrder(int id)
        {
            return dt.Orders.Find(id);
        }
        public int CreateOrderDetail(List<OrderDetail> orderDetails)
        {
          
                foreach (var item in orderDetails)
                {
                    dt.OrderDetails.Add(item);
                }
            dt.SaveChanges();
            return 1;
        }
        public int AddOrder(Order order)
        {
            try
            {
                
                dt.Orders.Add(order);
                dt.SaveChanges();
                return order.OrderID;
            }
            catch
            {
                return 0;
            }
        }
    }

}
