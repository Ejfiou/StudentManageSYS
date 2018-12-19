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

public partial class StudentModify : System.Web.UI.Page
{
    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();

    //string guid = "DEB16A39-5017-4CD0-96D6-DDAC7DD7BBDB";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)//第一次访问
        {
            string guid = this.Request["guid"];
            if (string.IsNullOrWhiteSpace(guid))
            {
                this.Response.Write("<script>alert('该页面有问题，请重新操作！'); window.close();</script>");
                return;
            }
            this.hfGuid.Value = guid.ToString();
            this.cboClassGuid.AppendDataBoundItems = true;
            this.cboClassGuid.DataSource = iBLL.QueryClass().ToList();
            this.cboClassGuid.DataTextField = "ClassName";
            this.cboClassGuid.DataValueField = "ClassGuid";
            this.cboClassGuid.DataBind();

            StudentQueryParameter stu = new StudentQueryParameter()
            {
                StudentGuid = guid
            };

            Students stus = iBLL.QueryByStuGuid(stu).ToList()[0];

            this.txtUserName.Text = stus.LoginId;
            this.cboClassGuid.SelectedValue = stus.ClassGuid;
            this.txtStuNo.Text = stus.StudentNO;
            this.txtName.Text = stus.StudentName;

            if (stus.Sex == "男")
            {
                this.rdoMale.Checked = true;
            }
            else
            {
                this.rdoFamel.Checked = true;
            }

            this.txtAddress.Text = stus.Address;
            this.cboClassGuid.Text = stus.ClassName;

        }
    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        this.Validate();
        if (!this.IsValid)
        {
            return;
        }
        Students student = new Students()
        {
            StudentGuid = this.hfGuid.Value,
            LoginId = this.txtUserName.Text,
            Sex = this.rdoMale.Checked ? rdoMale.Text : rdoFamel.Text,
            UserStateId = 1,
            StudentName = this.txtName.Text,
            ClassGuid = this.cboClassGuid.SelectedValue,
            StudentNO = this.txtStuNo.Text,
            Address = this.txtAddress.Text
        };

        string s = this.txtUserName.Text;
        bool rows = iBLL.Updata(student);
        if (rows)
        {
            this.Response.Write("<script>alert('操作成功！'); window.opener.document.getElementById('cphContent_btnQuery').click(); window.close();</script>");
        }
        else
        {
            this.Response.Write("<script>alert('操作失败！');window.history.go(-1);</script>");
        }
    }
}