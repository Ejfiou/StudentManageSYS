<%@ WebHandler Language="C#" Class="LoginHandler" %>

using System;
using System.Web;
using Student.IBLL;
using Student.BLL;
using Student.ModelStu;
using System.Text.RegularExpressions;
using System.IO;
using System.Text;
using System.Web.SessionState;
public class LoginHandler : IHttpHandler,IRequiresSessionState
{
    private IBLLLogin bllLog = new BLLLogin();

    public void ProcessRequest(HttpContext context)
    {
        string s =  context.Request.Form["isPostBack"];
        string isPostBack = context.Request["isPostBack"];
        if (isPostBack == "ok")//不是第一次访问
        {
            string txtUserName = context.Request["txtUserName"];
            string txtUserPwd = context.Request["txtUserPwd"];
            string remember = context.Request["remember"];
            string txtVerificationCode = context.Request["txtVerificationCode"];

            //验证数据
            if (string.IsNullOrWhiteSpace(txtUserName))
            {
                context.Response.Write("<script> alert('用户名不能为空'); window.history.go(-1); </script>");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtUserPwd))
            {
                context.Response.Write("<script> alert('密码不能为空'); window.history.go(-1); </script>");
                return;
            }

            if (!Regex.IsMatch(txtUserName.Trim(), @"^\w{2,}$"))
            {
                context.Response.Write("<script> alert('至少两个连续字符'); window.history.go(-1); </script>");
                return;
            }

            //验证验证码
            if (string.IsNullOrWhiteSpace(txtVerificationCode))
            {
                context.Response.Write("<script> alert('验证码不能为空'); window.history.go(-1); </script>");
                return;
            }

            object obj = context.Session["Code"];
            if (obj == null || string.IsNullOrWhiteSpace((obj.ToString())))
            {
                context.Response.Write("<script> alert('验证码有问题'); window.history.go(-1); </script>");
                return;
            }

            if (obj.ToString() != txtVerificationCode.ToUpper())
            {
                context.Response.Write("<script> alert('验证码错误'); window.history.go(-1); </script>");
                return;
            }



            //组装对象
            User u = new User()
            {
                LoginId = txtUserName.Trim(),
                LoginPwd = txtUserPwd.Trim(),

            };

            string result = "";
            if (bllLog.Login(u))
            {
                //result = "成功！";
                //context.Response.Redirect("StuMain.html");
                //记住我
                //设置cookice
                if (!string.IsNullOrWhiteSpace(remember))
                {
                    HttpCookie cook = new HttpCookie("LoginId", u.LoginId);
                    cook.Expires = DateTime.Now.AddMinutes(1);//时间
                    context.Response.Cookies.Add(cook);
                }

                //设置 session
                context.Session.Add("LoginIdUser", u);

                context.Response.Redirect("StudentHandler.ashx", false);
            }
            else
            {
                result = "用户名或密码不正确！";
                context.Response.Write("<script> alert('" + result + "'); window.history.go(-1); </script>");
            }
        }
        else //不是第一次访问
        {
            //统计访问网站的次数
            //object totalCountObj = context.Application["totalCount"];
            //int totalCount = 0;
            //if (totalCountObj == null)
            //{
            //    totalCount = 0;
            //}
            //else
            //{
            //    if (!int.TryParse(totalCountObj.ToString(),out totalCount))
            //    {
            //        totalCount = 0;
            //    }
            //}
            //totalCount++;
            //context.Application["totalCount"] = totalCount;




            //判断是否为已经登录
            //读取cookie
            HttpCookie cookClient = context.Request.Cookies.Get("LoginId");

            if (cookClient != null)
            {
                context.Response.Write("<script> alert('欢迎再次登录!用户：" + cookClient.Value + "您可直接进入'); window.location.href = 'StudentHandler.ashx';  </script>");
                return;
            }

            string filePath = context.Server.MapPath("~/Login.html");
            string fileContent = File.ReadAllText(filePath, Encoding.UTF8);

            fileContent = fileContent.Replace("<!--<%=LoginNum>-->", context.Application["totalCount"].ToString());

            context.Response.ContentType = "text/html; charset=utf-8";
            context.Response.Write(fileContent);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    //private BLLVerificationCode verification = new BLLVerificationCode();
    public void VerificationCode(HttpContext context)
    {
        string txtVerification = context.Request["txtVerification"];
        //string code = verification.CreateVerifyCode();            //取随机码  
        //verification.CreateImageOnPage(code, context);       // 输出图片
        //string code = context.Session["VerificationCode"].ToString();                   //Session 取出验证码  
        HttpSessionState session = HttpContext.Current.Session;                                               //["CheckCode"] = code;
        string code = session["VerificationCode"].ToString();
        context.Response.ContentType = "text/html";
        string vCode = context.Session["CheckCode"].ToString();

        string filePath = context.Server.MapPath("~/Login.html");
        string fileContent = File.ReadAllText(filePath, Encoding.UTF8);

        if (txtVerification.Trim().ToUpper() == vCode.ToUpper())
        {
            fileContent = fileContent.Replace("<!--%=ScriptManager%-->", "ScriptManager.RegisterStartupScript(this.Page, this.GetType(), 'Startup', 'alert('ValidatedCode is right!');', true);");
        }
    }
}