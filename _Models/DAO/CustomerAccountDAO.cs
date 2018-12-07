using _Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _Models.DAO
{
    public class CustomerAccountDAO
    {
        OnlineShop dt = null;
        public CustomerAccountDAO()
        {
            dt = new OnlineShop();
        }
        public int CheckLogin(string email,string password)
        {
            var list = dt.CustomerAccounts.Where(x => x.Email == email).ToList();
            if (list == null) return 0;
            list.Where(x => x.PassWord == password);
            if (list == null) return -1;
            return list.Count();
        }
        public int CreateAccount(CustomerAccount customerAccount)
        {
            try
            {
                dt.CustomerAccounts.Add(customerAccount);
                dt.SaveChanges();
                return 1;
            }

            catch
            {
                return 0;
            }
        }
        public CustomerAccount getCustomerAccount(string email)
        {
            return dt.CustomerAccounts.Where(x => x.Email == email).Single();
        }
    }
}
