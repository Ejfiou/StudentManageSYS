using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using Student.IBLL;
using Student.BLL;
using Student.ModelStuView;
using Student.ModelStu;
using System.Threading.Tasks;

[ServiceContract(Namespace = "")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class AsyncStudentAjaxService
{
    private string studentName = null;
    private string sex = null;
    private string className = null;

    private int pageMaxRowNumber = 3;
    private int pageNumber = 1;
    private int pageTotalNumber = 0;
    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();

    // 要使用 HTTP GET，请添加 [WebGet] 特性。(默认 ResponseFormat 为 WebMessageFormat.Json)
    // 要创建返回 XML 的操作，
    //     请添加 [WebGet(ResponseFormat=WebMessageFormat.Xml)]，
    //     并在操作正文中包括以下行:
    //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
    [OperationContract]
    public void DoWork()
    {
        // 在此处添加操作实现
        return;
    }

    // 在此处添加更多操作并使用 [OperationContract] 标记它们
    [OperationContract]
    public StudentQueryResultViewModel QueryPage(string txtStudentName, string cboSex, string cboClass, int pageNumber)
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

        List<Students> list = iBLL.QueryAll(s).ToList();
         
        StudentQueryResultViewModel result = new StudentQueryResultViewModel()
        {
            PageNumber = s.PageNumber,
            PageTotalNumber = s.PageTotalNumber,

            Rows = list.Select(t =>
                new StudentQueryItem
                {
                    StudentGuid = t.StudentGuid,
                    LoginId = t.LoginId,
                    ClassName = t.classs.ClassName,
                    StudentNO = t.StudentNO,
                    StudentName = t.StudentName,
                    Sex = t.Sex,
                    Address = t.Address
                })
        };
        return result;
    }

    //异步
    [OperationContract]
    public async Task< StudentQueryResultViewModel> QueryPageAsync(string txtStudentName, string cboSex, string cboClass, int pageNumber)
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

        List<Students> list =(await iBLL.QueryAllAsync(s)).ToList();

        StudentQueryResultViewModel result = new StudentQueryResultViewModel()
        {
            PageNumber = s.PageNumber,
            PageTotalNumber = s.PageTotalNumber,

            Rows = list.Select(t =>
                new StudentQueryItem
                {
                    StudentGuid = t.StudentGuid,
                    LoginId = t.LoginId,
                    ClassName = t.classs.ClassName,
                    StudentNO = t.StudentNO,
                    StudentName = t.StudentName,
                    Sex = t.Sex,
                    Address = t.Address
                })
        };
        return result;
    }
}
