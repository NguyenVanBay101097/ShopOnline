using _Models.DAO;
using _Models.EF;
using BotDetect.Web.Mvc;
using ShopOnline.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
       [ChildActionOnly]
        public ActionResult Create()
        {
            CustomerAccount userAccount = new CustomerAccount();
            return PartialView(userAccount);
        }
        [HttpPost]
        public ActionResult LoginCustomer(string txtEmail,string txtPassWord)
        {
            CustomerAccountDAO customerAccountDAO = new CustomerAccountDAO();
            var result = customerAccountDAO.CheckLogin(txtEmail, Encryptor.MD5Hash(txtPassWord));
            if (result == 1)
            {
                var customer = customerAccountDAO.getCustomerAccount(txtEmail);
                var customersession = new CustomerLogin();
                customersession.Email = customer.Email;
                customersession.PassWord = customer.PassWord;
                customersession.Name= customer.Name;
                Session.Add(Common.CommonConstants.Customer_SESSION, customersession);
                return Redirect("/");
            }
            else if (result == 0)
            {
                TempData["msg"] = MessageBox.Show("Tài Khoản Không Tồn Tại");
            }
            else if (result == -1)
            {
                ModelState.AddModelError("", "Bạn đã điền sai password");
            }
            return View(); 
        }
        [HttpPost]
        [AllowAnonymous]
        [SimpleCaptchaValidation("CaptchaCode", "registerCapcha", "Mã xác nhận không đúng!")]
        public ActionResult Register(CustomerAccount customerAccount,string gioiTinh)
        {
            if (ModelState.IsValid == true)
            {
                customerAccount.GioiTinh = gioiTinh;
                customerAccount.PassWord = Encryptor.MD5Hash(customerAccount.PassWord);
                customerAccount.ConfirmPassWord = Encryptor.MD5Hash(customerAccount.ConfirmPassWord);
                CustomerAccountDAO customerAccountDAO = new CustomerAccountDAO();
                var check = customerAccountDAO.CreateAccount(customerAccount);
                if (check == 1)
                {
                    TempData["msg"] = MessageBox.Show("Đăng kí thành công");
                    return RedirectToAction("Register", "User");
                }
                else
                {
                    TempData["msg"] = MessageBox.Show("Email này đã có người đăng kí");
                }
            }
            return View("Register");
        }
    }
}