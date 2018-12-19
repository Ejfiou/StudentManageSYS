<%@ WebHandler Language="C#" Class="StudentModifyHandler" %>

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

public class StudentModifyHandler : IHttpHandler
{
    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();
    public void ProcessRequest(HttpContext context)
    {
        string isPostBack = context.Request["isPostBack"];
        string guid = context.Request["guid"];
        if (isPostBack == "ok")//不是第一次访问
        {
            string txtUserName = context.Request["txtUserName"];
            string txtUserPwd = context.Request["txtLoginPwd"];
            string txtStuNo = context.Request["txtStuNo"];
            string txtName = context.Request["txtName"];
            string cboState = context.Request["cboState"];
            string sex = context.Request["sex"];
            string txtAddress = context.Request["txtAddress"];
            string cboClassGuid = context.Request["cboClassGuid"];

            //组装对象
            Students student = new Students()
            {
                StudentGuid = guid,
                LoginId = txtUserName.Trim(),
                LoginPwd = txtUserPwd.Trim(),
                Sex = string.IsNullOrWhiteSpace(sex.Trim()) ? null : sex.Trim(),
                UserStateId = 1,
                StudentName = txtName.Trim(),
                ClassGuid = string.IsNullOrWhiteSpace(cboClassGuid.Trim()) ? null : cboClassGuid.Trim(),
                StudentNO = txtStuNo.Trim(),
                Address = txtAddress.Trim()
            };

            bool rows = iBLL.Updata(student);
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
            StringBuilder sb = new StringBuilder();
            StudentQueryParameter stu = new StudentQueryParameter()
            {
                StudentGuid = guid
            };



            string filePath = context.Server.MapPath("~/StudentModify.html");
            string fileContent = File.ReadAllText(filePath, Encoding.UTF8);



            fileContent = fileContent.Replace("id='Guid'", $"id='Guid' value='{guid}'");
            //给文本框赋值

            Students student = iBLL.QueryByStuGuid(stu).ToList()[0];

            fileContent = fileContent.Replace("id='txtUserName'", $"id='txtUserName' value='{student.LoginId}'");
            fileContent = fileContent.Replace("id='txtLoginPwd'", $"id='txtLoginPwd' value='{student.LoginPwd}'");
            fileContent = fileContent.Replace("value='' id='null'", $"value='{student.ClassName}'");
            fileContent = fileContent.Replace("id='txtStuNo'", $"id='txtUserName' value='{student.StudentNO}'");
            fileContent = fileContent.Replace("id='txtName'", $"id='txtUserName' value='{student.StudentName}'");
            fileContent = fileContent.Replace($"value=\"{student.Sex}\"", $"value=\"{student.Sex}\" checked ");
            fileContent = fileContent.Replace("id='txtAddress'", $"id='txtAddress' value='{student.Address}'");

            //给ClassOption赋值
            IEnumerable<Class> queryClass = iBLL.QueryClass();
            foreach (var item in queryClass)
            {
                if (item.ClassName == student.ClassName)
                    sb.AppendLine($"<option value='{item.ClassGuid}' selected>{item.ClassName}</option>");
                else
                    sb.AppendLine($"<option value='{item.ClassGuid}'>{item.ClassName}</option>");
            }
            fileContent = fileContent.Replace("<!--<%=optionClass%>-->", sb.ToString());

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

