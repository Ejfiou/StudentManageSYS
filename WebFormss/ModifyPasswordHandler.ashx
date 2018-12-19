<%@ WebHandler Language="C#" Class="ModifyPasswordHandler" %>

using System;
using System.Web;
using Student.IBLL;
using Student.BLL;
using Student.ModelStu;
using Student.ModelStuView;
using System.Web.SessionState;
public class ModifyPasswordHandler : IHttpHandler,IRequiresSessionState
{

    private IBLLAdmin ibll = new BLLAdmin();
    public void ProcessRequest (HttpContext context)
    {
        object obj = context.Session["LoginIdUser"];
        if (obj == null && !(obj is User))
        {
            context.Response.Write("<script> alert('非法登录，请从登录页面登录'); window.location.href = 'LoginHandler.ashx';  </script>");
            return;
        }

        string txtOldPwd = context.Request["txtOldPwd"];
        string txtRePwd = context.Request["txtRePwd"];
        string txtNewPwd = context.Request["txtNewPwd"];


        if (string.IsNullOrWhiteSpace(txtOldPwd))
        {
            context.Response.Write("<script> alert('旧不能为空'); window.history.go(-1); </script>");
            return;
        }

        if (string.IsNullOrWhiteSpace(txtNewPwd))
        {
            context.Response.Write("<script> alert('密码不能为空'); window.history.go(-1); </script>");
            return;
        }
        if (txtNewPwd != txtRePwd)
        {
            context.Response.Write("<script> alert('两次密码不匹配'); window.history.go(-1); </script>");
            return;
        }

        StudentQueryParameter p = new StudentQueryParameter()
        {
            StudentGuid = (obj as User).Guid
        };

        string oldPwd = ibll.QueryByStuGuid(p).ToString();

        if (oldPwd != txtOldPwd)
        {
            context.Response.Write("<script> alert('旧密码错误！');window.history.go(-1); </script>");
            return;
        }

        if (ibll.UpdataPwd((obj as User).Guid,txtRePwd))
        {
            context.Response.Write("<script> alert('操作成功！'); window.location.href = 'StudentHandler.ashx'; </script>");
        }
        else
        {
            context.Response.Write("<script> alert('操作失败！'); window.history.go(-1); </script>");
        }

        context.Response.ContentType = "text/html; charset=utf-8";

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}