using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace ASP.NET_MVC.Models
{
    public class RegisterViewModel
    {
        [Display(Name ="用户名")]
        [Required(ErrorMessage ="用户名必填")]
        public string UserName { get; set; }

        [Display(Name = "密码")]
        [Required(ErrorMessage = "密码必填")]
        public string UserPwd { get; set; }

        [Display(Name = "确认密码")]
        [Required(ErrorMessage = "确认密码必填")]
        [Compare("UserPwd",ErrorMessage ="密码不一致")]
        public string ReUserPwd { get; set; }
        
    }
}