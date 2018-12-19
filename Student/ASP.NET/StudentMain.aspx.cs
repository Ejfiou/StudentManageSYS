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
public partial class StudentMain : System.Web.UI.Page
{
    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();

    private string studentName = null;
    private string sex = null;
    private string className = null;

    private int pageMaxRowNumber = 3;
    private int pageNumber = 1;
    private int pageTotalNumber = 0;


    protected void Page_Load(object sender, EventArgs e)
    {
        //得到客户端传送的数据
        studentName = this.txtStudentName.Text??"";
        sex = this.cboSex.Text??"";
        className = this.cboClass.Text??"";
        pageNumber = Convert.ToInt32(string.IsNullOrWhiteSpace(this.hfPageNumber.Value) ? "1":this.hfPageNumber.Value);
        pageTotalNumber = Convert.ToInt32(string.IsNullOrWhiteSpace(this.hfPageTotalNumber.Value) ? "0":this.hfPageTotalNumber.Value);

        if (!IsPostBack)
        {
            this.cboClass.AppendDataBoundItems = true;
            this.cboClass.DataSource = iBLL.QueryClass().ToList();
            this.cboClass.DataTextField = "ClassName";
            this.cboClass.DataValueField = "ClassName";
            this.cboClass.DataBind();

            this.hfPageNumber.Value = pageNumber.ToString();
            this.hfPageTotalNumber.Value = pageTotalNumber.ToString();

            //为了显示表格的标题
            this.gvShow.DataSource = new List<Students>();
            this.gvShow.DataBind();
        }
    }

    protected void btnQuery_Click(object sender, EventArgs e)
    {
        this.pnlPage.Visible = true;
        pageNumber = 1;
        
        SlowMethod();
    }

    private void SlowMethod()
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

        this.gvShow.EmptyDataText = "<center>查无此数据</center>";

        this.gvShow.DataSource = iBLL.QueryAll(s).ToList();
        this.gvShow.DataBind();

        this.hfPageNumber.Value = s.PageNumber.ToString();
        this.hfPageTotalNumber.Value = s.PageTotalNumber.ToString();
        this.pageMsg.Text = $"第{s.PageNumber}页，共{s.PageTotalNumber}页";

        this.First.Enabled = true;
        this.Previous.Enabled = true;
        this.Next.Enabled = true;
        this.Last.Enabled = true;

        if (s.PageNumber <= 1)
        {
            this.First.Enabled = false;
            this.Previous.Enabled = false;
        }

        if (s.PageNumber >= s.PageTotalNumber)
        {
            this.Next.Enabled = false;
            this.Last.Enabled = false;
        }
    }

    public string JsRemove(string loginId,string guid)
    {
        return $"Remove('{loginId}','{guid}');return false";
    }

    protected void First_Click(object sender, EventArgs e)
    {
        pageNumber = 1;
        SlowMethod();
    }

    protected void Previous_Click(object sender, EventArgs e)
    {

        pageNumber--;
        SlowMethod();
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        pageNumber++;
        SlowMethod();
    }

    protected void Last_Click(object sender, EventArgs e)
    {
        pageNumber = pageTotalNumber;
        SlowMethod();
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //this.Response.Write("<script>window.open('StudentAdd.aspx');</script>");
    }
}