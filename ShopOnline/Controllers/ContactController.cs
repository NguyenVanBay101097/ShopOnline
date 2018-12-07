﻿using _Models.DAO;
using _Models.EF;
using ShopOnline.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class ContactController : Controller
    {
        // GET: LienHe
        public ActionResult Index()
        {
            TempData["msg"] = MessageBox.Show(thongbao);
            ContactDAO contactDAO = new ContactDAO();
            var contact = contactDAO.ListAll().SingleOrDefault();
            return View(contact);
        }
        private static string thongbao="";
        public JsonResult Send(string txtName,string txtPhone,string txtAddress,string txtEmail,string txtContent)
        {
            ContactDAO contactDAO = new ContactDAO();
            Feedback feedback = new Feedback();
            feedback.Address = txtAddress;
            feedback.Content = txtContent;
            feedback.Email = txtEmail;
            feedback.CreateDate = DateTime.Now;
            feedback.FeedbackName = txtName;
            txtPhone = string.IsNullOrEmpty(txtPhone) ? "0" : txtPhone;
            feedback.Phone = int.Parse(txtPhone);
            var tempstatus = contactDAO.InsertFeedback(feedback);
            thongbao = "Thành công";
            return Json(new
            {
                status = tempstatus
            });
        }
    }
}