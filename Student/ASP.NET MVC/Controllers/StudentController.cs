using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Student.IBLL;
using Student.BLL;
using Student.ModelStuView;
using Student.ModelStu;

namespace ASP.NET_MVC.Controllers
{
    public class StudentController : Controller
    {
        private IBLLStudentSeacher iBLL = new BLLStudentSeacher();

        public ActionResult Index()
        {
            IEnumerable<SelectListItem> list = iBLL.QueryClass().Select(s => new SelectListItem() { Text = s.ClassName });
            ViewBag.ClassList = list.ToList();


            return View(new ASP.NET_MVC.Models.StudentQueryParameter() { PageMaxRowNumber=3,PageNumber=3,PageTotalNumber=0});
        }

        // GET: Student
        //POST
        [HttpPost]
        public ActionResult Index(ASP.NET_MVC.Models.StudentQueryParameter model)
        { 
            IEnumerable<SelectListItem> list = iBLL.QueryClass().Select(s => new SelectListItem() { Text = s.ClassName });
            ViewBag.ClassList = list.ToList();

            StudentQueryParameter st = new StudentQueryParameter()
            {
                ClassName = model.ClassName,
                StudentName = model.StudentName,
                Sex = model.Sex,
                PageMaxRowNumber = model.PageMaxRowNumber=3,
                PageNumber = model.PageNumber
            };

            IEnumerable<Students> listStudents = iBLL.QueryAll(st);
            ViewBag.listStudents = listStudents.ToList();
            return View();
        }
    }
}