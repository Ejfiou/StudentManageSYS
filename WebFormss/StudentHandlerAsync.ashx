<%@ WebHandler Language="C#" Class="StudentHandlerAsync" %>

using System;
using System.Web;
using System.Web.SessionState;
using Student.IBLL;
using Student.BLL;
using System.IO;
using System.Text;
using Student.ModelStuView;
using Student.ModelStu;

public class StudentHandlerAsync : IHttpHandler
{
    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();
    
    public void ProcessRequest (HttpContext context)
    {
        StringBuilder sb = new StringBuilder();

        foreach (var item in iBLL.QueryClass())
        {
            sb.AppendLine($"<option value='{item.ClassName}'>{item.ClassName}</option>");
        }

        string filePath = context.Server.MapPath("~/StudentMainAsync.html");
        string fileContent = File.ReadAllText(filePath, Encoding.UTF8);
        fileContent = fileContent.Replace("<!--<%=optionClass%>-->", sb.ToString());

        context.Response.ContentType = "text/html; charset=utf-8";
        context.Response.Write(fileContent);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}