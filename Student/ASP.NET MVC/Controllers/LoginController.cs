using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Drawing;
using System.Drawing.Drawing2D;
using ASP.NET_MVC.Models;
using Student.IBLL;
using Student.BLL;
using Student.ModelStu;
using System.Text;
using Student.ModelStuView;

namespace ASP.NET_MVC.Controllers
{
    public class LoginController : Controller
    {
        //登录
        private IBLLLogin bllLog = new BLLLogin();

        //注册
        private IBLLAdmin iBLLAdmin = new BLLAdmin();

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        //POST
        [HttpPost]
        public ActionResult Index(LoginViewModel model)
        {
            //验证数据有效性
            
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            //验证验证码
            object obj = this.Session["Code"];
            if (obj == null || string.IsNullOrWhiteSpace((obj.ToString())))
            {
                // this.Response.Write("<script> alert('验证码有问题'); window.history.go(-1); </script>");
                   return this.Content(" alert('验证码有问题'); window.history.go(-1);");

            }

            if (obj.ToString() != model.VerificationCode.ToUpper())
            {
                //this.Response.Write("<script> alert('验证码错误'); window.history.go(-1); $('#txtVerificationCode').focus(); </script>");
                 return this.Content("<script> alert('验证码错误'); window.history.go(-1); $('#txtVerificationCode').focus(); </script>");
               
            }

            //组装对象
            User u = new User()
            {
                LoginId = model.UserName.Trim(),
                LoginPwd = model.UserPwd.Trim(),

            };

            string result = "";
            if (bllLog.Login(u))
            {
                //result = "成功！";
                //context.Response.Redirect("StuMain.html");
                //记住我
                //设置cookice
                if (model.Remember)
                {
                    HttpCookie cook = new HttpCookie("LoginId", u.LoginId);
                    cook.Expires = DateTime.Now.AddMinutes(1);//时间
                    this.Response.Cookies.Add(cook);
                }

                //设置 session
                this.Session.Add("LoginIdUser", u);

                // this.Response.Redirect("StudentMain.aspx");
                //this.Response.Redirect("Home.aspx");

                return RedirectToAction("Index", "Home");
            }
            else
            {
                result = "用户名或密码不正确！";
                //this.Response.Write("<script> alert('" + result + "'); window.history.go(-1); </script>");
                return Content("<script>alert('" + result + "'); window.history.go(-1); </script>");
            }
        }

        //Get
        [HttpGet]
        public ActionResult Register()
        {

            return View();
        }


        //Post
        [HttpPost]
        public ActionResult Register(RegisterViewModel model)
        {
            //验证数据有效性
            if (!ModelState.IsValid)
            {
                return View(model);
            }


            //组装对象
            User user = new User()
            {
                Guid = Guid.NewGuid().ToString(),
                LoginId = model.UserName,
                LoginPwd = model.UserPwd
            };

            if (iBLLAdmin.Add(user))
            {
               return this.Content("<script> alert('操作成功！'); window.location.href = '"+this.Url.Action("Index")+"'; </script>");
            }
            else
            {
                return this.Content("<script> alert('操作失败！'); window.history.go(-1); </script>");
            }
        }


        /// <summary>   
        /// 产生随机字符串   
        /// </summary>   
        /// <param name="num">随机出几个字符</param>   
        /// <returns>随机出的字符串</returns>   
        private string GenCode(int num)
        {
            string str = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            char[] chastr = str.ToCharArray();
            // string[] source ={ "0", "1", "2","3", "4", "5", "6", "7","8", "9", "A", "B", "C","D", "E", "F", "G", "H","I", "J", "K", "L", "M","N", "O", "P", "Q", "R","S", "T", "U", "V", "W","X", "Y", "Z", "#", "$", "%","&", "@" };   
            string code = "";
            Random rd = new Random();
            int i;
            for (i = 0; i < num; i++)
            {
                //code += source[rd.Next(0, source.Length)];   
                code += str.Substring(rd.Next(0, str.Length), 1);
            }
            return code;
        }


        public ActionResult VerificationCode()
        {
            string checkCode = GenCode(4);  // 产生5位随机字符   
            this.Session["Code"] = checkCode; //将字符串保存到Session中，以便需要时进行验证   

            Bitmap image = new Bitmap(70, 22); //生成随机字符图片

            Graphics g = Graphics.FromImage(image);
            try
            {
                //生成随机生成器   
                Random random = new Random();

                //清空图片背景色   

                g.Clear(Color.White);

                // 画图片的背景噪音线   
                int i;
                for (i = 0; i < 25; i++)
                {
                    int x1 = random.Next(image.Width);
                    int x2 = random.Next(image.Width);
                    int y1 = random.Next(image.Height);
                    int y2 = random.Next(image.Height);
                    g.DrawLine(new Pen(Color.Silver), x1, y1, x2, y2);
                }

                Font font = new System.Drawing.Font("Arial", 12, (System.Drawing.FontStyle.Bold));
                LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2F, true);
                g.DrawString(checkCode, font, brush, 2, 2);

                //画图片的前景噪音点   
                g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);

                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);

                //this.Response.ClearContent();
                //this.Response.ContentType = "image/Gif";
                //this.Response.BinaryWrite(ms.ToArray());

                return File(ms.ToArray(), "image/Gif");
            }
            finally
            {
                g.Dispose();
                image.Dispose();
            }
        }

        [HttpGet]
        public ActionResult ModifyPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ModifyPassword(ModifyPasswordViewModel model)
        {
            Object obj = this.Session["LoginIdUser"];
            if (obj == null && !(obj is User))
            {
                //this.Response.Write("<script> alert('非法登录，请从登录页面登录'); window.location.href = 'LoginHandler.ashx';  </script>");
                //return;
                return Content("<script> alert('非法登录，请从登录页面登录'); window.location.href = '" + this.Url.Action("Index") + "';  </script>");
            }

            //验证数据有效性
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            Student.ModelStuView.StudentQueryParameter p = new Student.ModelStuView.StudentQueryParameter()
            {
                StudentGuid = (obj as User).Guid
            };

            string oldPwd = iBLLAdmin.QueryByStuGuid(p).ToList()[0].LoginPwd;


            if (oldPwd != model.OldPassword)
            {
                return this.Content("<script> alert('旧密码错误！');window.history.go(-1); </script>");
                
            }

            if (iBLLAdmin.UpdataPwd((obj as User).Guid, model.NewPassword))
            {
                return this.Content("<script> alert('操作成功！'); window.location.href = '"+this.Url.Action("Index","Home")+"'; </script>");
            }
            else
            {
                return this.Content("<script> alert('操作失败！'); window.history.go(-1); </script>");
            }
        }
    }
}
