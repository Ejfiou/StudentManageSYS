using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ASP.NET_MVC.Models
{
    public class LoginViewModel
    {

        [Display(Name ="用户名：")]
        [Required(ErrorMessage = "用户名不能为空")]
        [RegularExpression(@"^\w{2,}$",ErrorMessage = "用户名至少为两个连续字符！")]
        public string UserName { get; set; }


        [Display(Name = "密  码：")]
        [Required(ErrorMessage = "密码不能为空")]
        public string UserPwd { get; set; }


        [Display(Name = "请输入验证码：")]
        [Required(ErrorMessage = "验证码不能为空")]
        public string VerificationCode { get; set; }

        [Display(Name ="记住我？")]
        public bool Remember { get; set; }
    }
}