namespace _Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CustomerAccount")]
    public partial class CustomerAccount
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [Key]
        [StringLength(50)]
        public string Email { get; set; }

        [Required]
        [StringLength(maximumLength: 50, MinimumLength = 6, ErrorMessage = "Số kí tự phải lớn hơn 6 và ít hơn 50")]
        [Display(Name="Mật Khẩu")]
        public string PassWord { get; set; }

        [StringLength(50)]
        [Display(Name = "Họ Tên")]

        public string Name { get; set; }

        [Display(Name="Giới Tính")]
        [StringLength(50)]
        public string GioiTinh { get; set; }

        public DateTime? BirthDay { get; set; }
        [Display(Name = "Số Điện Thoại")]
        public int TelephoneNumber { get; set; }
        [Display(Name = "Xác Nhận Mật Khẩu")]
        [StringLength(maximumLength:50,MinimumLength =6,ErrorMessage ="Số kí tự phải lớn hơn 6 và ít hơn 50")]
        [Compare("PassWord",ErrorMessage ="Xác nhận password sai")]
        public string ConfirmPassWord { get; set; }
    }
}
