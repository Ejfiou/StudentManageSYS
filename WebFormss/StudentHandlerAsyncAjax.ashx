<%@ WebHandler Language="C#" Class="StudentHandlerAsyncAjax" %>

using System;
using System.Web;
using System.Web.SessionState;
using Student.IBLL;
using Student.BLL;
using Student.ModelStuView;
using Student.ModelStu;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
public class StudentHandlerAsyncAjax : IHttpHandler,IHttpAsyncHandler
{
    private string studentName = null;
    private string sex = null;
    private string className = null;

    private int pageMaxRowNumber = 3;
    private int pageNumber = 1;
    private int pageTotalNumber = 0;
    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();

    public void ProcessRequest (HttpContext context) {

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

    public IAsyncResult BeginProcessRequest(HttpContext context,AsyncCallback cb , object ex)
    {
        return SlowMethod(context, cb);
    }


    private async Task SlowMethod(HttpContext context,AsyncCallback cb)
    {
        //得到客户端传送的数据
        studentName = context.Request["txtStudentName"] ?? "";
        sex = context.Request["cboSex"] ?? "";
        className = context.Request["cboClass"] ?? "";
        pageNumber = Convert.ToInt32(string.IsNullOrWhiteSpace(context.Request["pageNumber"]) ? "1" : context.Request["pageNumber"]);

        //组装对象
        StudentQueryParameter s = new StudentQueryParameter()
        {
            ClassName = className.Trim(),
            StudentName = studentName.Trim(),
            Sex = sex.Trim(),
            PageMaxRowNumber = pageMaxRowNumber,
            PageNumber = pageNumber
        };

        //StringBuilder sb = new StringBuilder();

        //foreach (var item in await iBLL.QueryAllAsync(s))
        //{
        //    sb.AppendLine
        //    (
        //        $"<tr><td>{item.LoginId}</td>" +
        //        $"<td>{item.classs.ClassName}</td>" +
        //        $"<td>{item.StudentNO}</td>" +
        //        $"<td>{item.StudentName}</td>" +
        //        $"<td>{item.Sex}</td>" +
        //        $"<td>{item.Address}</td>" +
        //        $"<td><input type='button' value='修改' onclick=\"(modify('{item.StudentGuid}'))\" /></td>"+
        //        $"<td><input type='button' value='删除' onclick=\"(Remove('{item.StudentGuid}'))\" /></td></tr>"
        //    );
        //}

        //string filePath = context.Server.MapPath("~/StudentMain.html");


        IEnumerable<Students> temp = await iBLL.QueryAllAsync(s);
        var students = await Task.Run(() => { return temp.ToList(); });

        if (s.PageTotalNumber <= 0)
        {

        }
        else if (s.PageNumber > s.PageTotalNumber)
        {
            s.PageNumber = 1;

            temp = await iBLL.QueryAllAsync(s);
            students = await Task.Run(() => { return temp.ToList(); });
        }



        string fileContent = JsonConvert.SerializeObject(
            new
            {
                s.PageNumber,
                s.PageTotalNumber,
                Rows = students.Select(t =>
                new
                {
                    t.StudentGuid,
                    t.LoginId,
                    t.classs.ClassName,
                    t.StudentNO,
                    t.StudentName,
                    t.Sex,
                    t.Address
                })
            });

        context.Response.ContentType = "application/json; charset=utf-8";
        context.Response.Write(fileContent);

        cb(new MyAsyncResult());
    }
    public void EndProcessRequest(IAsyncResult result)
    {

    }
}