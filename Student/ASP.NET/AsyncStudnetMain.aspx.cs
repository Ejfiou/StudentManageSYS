using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Student.IBLL;
using Student.BLL;
using Student.ModelStuView;
using Student.ModelStu;
public partial class AsyncStudnetMain : System.Web.UI.Page
{
    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)//第一次访问
        {
            this.cboClass.AppendDataBoundItems = true;
            this.cboClass.DataSource = iBLL.QueryClass().ToList();
            this.cboClass.DataTextField = "ClassName";
            this.cboClass.DataValueField = "ClassName";
            this.cboClass.DataBind();

            this.hfPageNumber.Value = "1";
            this.hfPageTotalNumber.Value = "0";

            //为了显示表格的标题
            this.gvShow.DataSource = new List<Students>();
            this.gvShow.DataBind();
        }
    }

    public string JsRemove(string loginId, string guid)
    {
        return $"Remove('{loginId}','{guid}');return false";
    }

    protected void btnQuery_Click(object sender, EventArgs e)
    {

    }
}