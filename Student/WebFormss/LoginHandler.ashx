<%@ WebHandler Language="C#" Class="LoginHandler" %>

using System;
using System.Web;
using Student.IBLL;
using Student.BLL;
using Student.ModelStu;
using System.Text.RegularExpressions;
public class LoginHandler : IHttpHandler
{
    private  IBLLLogin bllLog = new BLLLogin();

    public void ProcessRequest (HttpContext context)
    {
        string txtUserName = context.Request["txtUserName"];
        string txtUserPwd = context.Request["txtUserPwd"];

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

        //组装对象
        User u = new User()
        {
            LoginId = txtUserName.Trim(),
            LoginPwd = txtUserPwd.Trim()
        };

        string result = "";
        if (bllLog.Login(u))
        {
            //result = "成功！";
            //context.Response.Redirect("StuMain.html");
           context.Response.Redirect("StudentHandler.ashx"); 
        }
        else
        {
            result = "用户名或密码不正确！";
            context.Response.Write("<script> alert('"+result+"'); window.history.go(-1); </script>");
        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }
}