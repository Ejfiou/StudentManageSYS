using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Student.IBLL;
using Student.BLL;
using Student.ModelStu;

/// <summary>
/// WebService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
 [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{
    private IBLLAdmin iBLLAdmin = new BLLAdmin();

    public WebService()
    {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public void IsLoginIdRepeat(string txtUserName)
    {
       //string txtUserName = HttpContext.Current.Request["txtUserName"];

        User admin = new User()
        {
            LoginId = txtUserName
        };

        bool flag = iBLLAdmin.IsLoginIdRepeat(admin);
        HttpContext.Current.Response.Write(flag);
    }
}
