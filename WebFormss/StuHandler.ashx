<%@ WebHandler Language="C#" Class="StudentHandler" %>

using System;
using System.Web;
using Student.BLL;
using Student.ModelStu;
using Student.ModelStuView;
using Student.IBLL;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
public class StudentHandler : IHttpHandler
{
    private IBLLStudentSeacher bllstu = new BLLStudentSeacher();

    public void ProcessRequest (HttpContext context)
    {
        string studentName = context.Request["txtStudentName"]??"";
        string sex = context.Request["cboSex"]??"";

        context.Response.ContentType = "text/html; charset=utf-8";
        //context.Response.ContentType = "text/plain";
        StudentQueryParameter s = new StudentQueryParameter()
        {
            ClassName = "",
            StudentName = studentName,
            Sex = sex,
            PageMaxRowNumber = 5,
            PageNumber = 1
        };

        StringBuilder sb = new StringBuilder();
        IEnumerable<Students> temp = bllstu.QueryAll(s);

        foreach (var item in temp)
        {
            sb.AppendFormat
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
        //context.Response.ContentType = "text/plain";

        string path = context.Server.MapPath("~/StuMain.html");
        string str = File.ReadAllText(path, Encoding.UTF8);
        str = str.Replace("<!--<%=tr%>-->", sb.ToString());
        context.Response.Write(str);
        
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}