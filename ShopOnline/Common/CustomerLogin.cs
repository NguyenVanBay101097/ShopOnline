using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopOnline.Common
{
    [Serializable]
    public class CustomerLogin
    {
        private string email;
        private string passWord;
        private string name;

        public string Email { get => email; set => email = value; }
        public string PassWord { get => passWord; set => passWord = value; }
        public string Name { get => name; set => name = value; }
    }
}