<%@ WebHandler Language="C#" Class="RegisterHandler" %>

using System;
using System.Web;
using Student.IBLL;
using Student.BLL;
using Student.ModelStu;
using System.Text;
public class RegisterHandler : IHttpHandler
{
    private IBLLAdmin iBLLAdmin = new BLLAdmin();
    public void ProcessRequest (HttpContext context)
    {
        context.Response.ContentType = "text/html; charset=utf-8";

        string txtUserName = context.Request["txtUserName"];
        string txtUserPwd = context.Request["txtUserPwd"];
        string txtReUserPwd = context.Request["txtReUserPwd"];

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
        if (txtUserPwd != txtReUserPwd)
        {
            context.Response.Write("<script> alert('两次密码不匹配'); window.history.go(-1); </script>");
            return;
        }

        User user = new User()
        {
            Guid = Guid.NewGuid().ToString(),
            LoginId = txtUserName,
            LoginPwd = txtUserPwd
        };

        if (iBLLAdmin.Add(user))
        {
            context.Response.Write("<script> alert('操作成功！'); window.location.href = 'LoginHandler.ashx'; </script>");
        }
        else
        {
            context.Response.Write("<script> alert('操作失败！'); window.history.go(-1); </script>");
        }

        //context.Response.Write("Hello World");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}