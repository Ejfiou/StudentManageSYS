using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace ASP.NET_MVC.Models
{
    public class StudentQueryParameter
    {
        [Display(Name = "请选择要查询的班级")]
        public string ClassName { get; set; }

        [Display(Name = "请选择要查询的性别")]
        public string Sex { get; set; }


        public string StudentGuid { get; set; }

        [Display(Name = "请输入要查询的姓名")]
        public string StudentName { get; set; }

        public int PageMaxRowNumber { get; set; }//每页呈现的最大行数

        public int PageNumber { get; set; }//页数


        public int PageTotalNumber { get; set; }//总页数
    }
}