<%@ WebHandler Language="C#" Class="StudentAddHandler" %>

using System;
using System.Web;
using System.IO;
using System.Text;
using Student.IBLL;
using Student.BLL;
using Student.ModelStuView;
using Student.ModelStu;


public class StudentAddHandler : IHttpHandler
{
    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html; charset=utf-8";
        string isPostBack = context.Request["isPostBack"];
        if (isPostBack == "ok")//不是第一次访问
        {
            string cboClassGuid = context.Request["cboClassGuid"];
            string txtUserName = context.Request["txtUserName"];
            string txtUserPwd = context.Request["txtUserPwd"];
            string txtStuNo = context.Request["txtStuNo"];
            string txtName = context.Request["txtName"];
            string cboState = context.Request["cboState"];
            string sex = context.Request["sex"];
            string txtAddress = context.Request["txtAddress"];

            //组装对象
            Students student = new Students()
            {
                LoginId = txtUserName.Trim(),
                StudentGuid = Guid.NewGuid().ToString(),
                LoginPwd = txtUserPwd.Trim(),
                Sex = string.IsNullOrWhiteSpace(sex.Trim()) ? null : sex.Trim(),
                UserStateId = Convert.ToInt32(string.IsNullOrWhiteSpace(cboState) ? "0" : cboState.Trim()),
                StudentName = txtName.Trim(),
                ClassGuid = string.IsNullOrWhiteSpace(cboClassGuid.Trim()) ? null : cboClassGuid.Trim(),
                StudentNO = txtStuNo.Trim(),
                Address = txtAddress.Trim()
            };

            bool rows = iBLL.Insert(student);
            if (rows)
            {
                context.Response.Write("<script> alert('操作成功！'); window.opener.document.getElementById('btnQuery').click(); window.close();</script>");
            }
            else
            {
                context.Response.Write("<script>alert('操作失败！');Window.history.go(-1);</script>");
            }
        }
        else//第一次访问
        {
            StringBuilder sb = new StringBuilder();
            foreach (var item in iBLL.QueryClass())
            {
                sb.AppendLine($"<option value='{item.ClassGuid}'>{item.ClassName}</option>");
            }

            string filePath = context.Server.MapPath("~/StudentAdd.html");
            string fileContent = File.ReadAllText(filePath, Encoding.UTF8);
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