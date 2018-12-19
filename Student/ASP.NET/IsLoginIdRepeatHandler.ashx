<%@ WebHandler Language="C#" Class="IsLoginIdRepeatHandler" %>

using System;
using System.Web;
using Student.IBLL;
using Student.BLL;
using Student.ModelStu;

public class IsLoginIdRepeatHandler : IHttpHandler
{
    private IBLLAdmin iBLLAdmin = new BLLAdmin();
    public void ProcessRequest (HttpContext context)
    {
        string txtUserName = context.Request["txtUserName"];
      
        User admin = new User()
        {
            LoginId = txtUserName
        };

        bool f = iBLLAdmin.IsLoginIdRepeat(admin);

        context.Response.ContentType = "text/plain";
        context.Response.Write(f);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}