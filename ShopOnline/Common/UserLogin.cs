using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopOnline.Common
{
    [Serializable]
    public class UserLogin
    {
        private long userID;
        private string userAccount;

        public long UserID { get => userID; set => userID = value; }
        public string UserAccount { get => userAccount; set => userAccount = value; }
    }
}