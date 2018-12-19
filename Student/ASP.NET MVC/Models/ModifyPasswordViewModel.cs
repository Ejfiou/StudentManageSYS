using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace ASP.NET_MVC.Models
{
    public class ModifyPasswordViewModel
    {
        
        public string Guid { get; set; }

        [Display(Name = "旧密码")]
        [Required(ErrorMessage = "必填")]
        public string OldPassword { get; set; }


        [Display(Name = "新密码")]
        [Required(ErrorMessage = "必填")]
        public string NewPassword { get; set; }


        [Display(Name = "确认密码")]
        [Required(ErrorMessage = "必填")]
        [Compare("NewPassword",ErrorMessage ="密码不一致")]
        public string ConfirmPassword { get; set; }

    }
}