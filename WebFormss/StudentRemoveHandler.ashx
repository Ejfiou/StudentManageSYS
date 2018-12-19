<%@ WebHandler Language="C#" Class="StudentRemoveHandler" %>

using System;
using System.Web;
using System.IO;
using System.Text;
using Student.IBLL;
using Student.BLL;
using Student.ModelStuView;
using Student.ModelStu;
using System.Collections.Generic;
using System.Linq;

public class StudentRemoveHandler : IHttpHandler
{

    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();

    public void ProcessRequest(HttpContext context)
    {
        string isPostBack = context.Request["isPostBack"];
        string guid = context.Request["guid"];
        if (isPostBack == "ok")//不是第一次访问
        {
            //组装对象
            StudentQueryParameter s = new StudentQueryParameter()
            {
                StudentGuid = guid,
            };

            bool rows = iBLL.Del(s.StudentGuid);
            if (rows)
            {
                context.Response.Write("<script>alert('操作成功！'); window.opener.document.getElementById('btnQuery').click(); window.close();</script>");
            }
            else
            {
                context.Response.Write("<script>alert('操作失败！');window.history.go(-1);</script>");
            }
        }
        else//第一次访问
        {
            if (string.IsNullOrWhiteSpace(guid))
            {
                context.Response.Write("<script>alert('该页面有问题，请重新操作！'); window.close();</script>");
                return;
            }

            StudentQueryParameter stu = new StudentQueryParameter()
            {
                StudentGuid = guid
            };


            //获取html文件路径
            string filePath = context.Server.MapPath("~/StudentRemove.html");
            string fileContent = File.ReadAllText(filePath, Encoding.UTF8);


            //传递guid
            fileContent = fileContent.Replace("id='Guid'", $"id='Guid' value='{guid}'");

            //给文本框赋值
            Students student = iBLL.QueryByStuGuid(stu).ToList()[0];

            fileContent = fileContent.Replace("<!--<%=LoginId%>-->", $"{student.LoginId}");
            fileContent = fileContent.Replace("<!--<%=ClassName%>-->", $"{student.ClassName}");
            fileContent = fileContent.Replace("<!--<%=StudentNo%>-->", $"{student.StudentNO}");
            fileContent = fileContent.Replace("<!--<%=StudentName%>-->", $"{student.StudentName}");
            fileContent = fileContent.Replace("<!--<%=Sex%>-->", $"{student.Sex}");
            fileContent = fileContent.Replace("<!--<%=Address%>-->", $"{student.Address}");


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

}