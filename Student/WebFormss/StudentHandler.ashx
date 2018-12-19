<%@ WebHandler Language="C#" Class="StudentHandler" %>

using System;
using System.Web;
using Student.IBLL;
using Student.BLL;
using System.IO;
using System.Text;
using Student.ModelStuView;
public class StudentHandler : IHttpHandler
{
    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();

    private string studentName = null;
    private string sex = null;
    private string className = null;

    private int pageMaxRowNumber = 3;
    private int pageNumber = 1;
    private int pageTotalNumber = 0;

    public void ProcessRequest (HttpContext context)
    {
        //得到客户端传送的数据
        studentName = context.Request["txtStudentName"]??"";
        sex = context.Request["cboSex"]??"";
        className = context.Request["cboClass"]??"";
        pageNumber = Convert.ToInt32(context.Request["pageNumber"]??"1");
        string isPostBack = context.Request["isPostBack"];

        string aBtn = context.Request["aBtn"];
        if (string.IsNullOrWhiteSpace(aBtn))
        {
            pageNumber = 1;
        }

        if (isPostBack == "ok")
        {
            SlowMethod(context);
            return;
        }


        StringBuilder sb = new StringBuilder();
        foreach (var item in iBLL.QueryClass())
        {
            sb.AppendLine($"<option value'{item.ClassName}'>{item.ClassName}</option>");
        }

        string filePath = context.Server.MapPath("~/StudentMain.html");
        string fileContent = File.ReadAllText(filePath,Encoding.UTF8);
        fileContent = fileContent.Replace("<!--<%=optionClass%>-->", sb.ToString());

        fileContent = fileContent.Replace("id='pageNumber'", $"id='pageNumber' value='{pageNumber}'");
        fileContent = fileContent.Replace("id='pageTotalNumber'", $"id='pageTotalNumber' value='{pageTotalNumber}'");


        context.Response.ContentType = "text/html; charset=utf-8";
        context.Response.Write(fileContent);
    }

    private void SlowMethod(HttpContext context)
    {
        //组装对象
        StudentQueryParameter s = new StudentQueryParameter()
        {
            ClassName = className.Trim(),
            StudentName = studentName.Trim(),
            Sex = sex.Trim(),
            PageMaxRowNumber = pageMaxRowNumber,
            PageNumber = pageNumber
        };

        StringBuilder sb = new StringBuilder();

        foreach (var item in iBLL.QueryAll(s))
        {
            sb.AppendLine
            (
                $"<tr><td>{item.LoginId}</td>"+
                $"<td>{item.classs.ClassName}</td>"+
                $"<td>{item.StudentNO}</td>"+
                $"<td>{item.StudentName}</td>"+
                $"<td>{item.Sex}</td>"+
                $"<td>{item.Address}</td>"+
                "<td><input type='button' value='修改'/></td><td><input type='button' value='删除' /></td></tr>"
            );
        }

        string filePath = context.Server.MapPath("~/StudentMain.html");
        string fileContent = File.ReadAllText(filePath,Encoding.UTF8);
        fileContent = fileContent.Replace("<!--<%=trStudent%>-->", sb.ToString());

        sb = new StringBuilder();
        foreach (var item in iBLL.QueryClass())
        {
            if (item.ClassName == className)
            {
                sb.AppendLine($"<option value'{item.ClassName}' selected>{item.ClassName}</option>");
            }
            else
            {
                sb.AppendLine($"<option value'{item.ClassName}'>{item.ClassName}</option>");
            }
        }
        fileContent = fileContent.Replace("<!--<%=optionClass%>-->", sb.ToString());

        //呈现上一次查询的信息
        fileContent = fileContent.Replace("id='txtStudentName'", $"id='txtStudentName' value='{studentName}'");
        fileContent = fileContent.Replace($"value='{sex}'", $"value='{sex}' selected");

        fileContent = fileContent.Replace("id='pageNumber'", $"id='pageNumber' value='{s.PageNumber}'");
        fileContent = fileContent.Replace("id='pageTotalNumber'", $"id='pageTotalNumber' value='{s.PageTotalNumber}'");


        fileContent = fileContent.Replace("<!--<%=pageNumber%>-->",s.PageNumber.ToString());
        fileContent = fileContent.Replace("<!--<%=pageTotalNumber%>-->",s.PageTotalNumber.ToString());

        context.Response.ContentType = "text/html; charset=utf-8";
        context.Response.Write(fileContent);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}