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

public partial class StudentRemove : System.Web.UI.Page
{
    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string guid = this.Request["guid"];
            if (string.IsNullOrWhiteSpace(guid))
            {
                this.Response.Write("<script>alert('该页面有问题，请重新操作！'); window.close();</script>");
                return;
            }

            this.hfGuid.Value = guid;
            StudentQueryParameter stu = new StudentQueryParameter()
            {
                StudentGuid = guid
            };

            Students stus = iBLL.QueryByStuGuid(stu).ToList()[0];

            this.lblLoginId.Text = stus.LoginId;
            this.lblClassName.Text = stus.ClassName;
            this.lblStudentNo.Text = stus.StudentNO;
            this.lblStudentName.Text = stus.StudentName;
            this.lblSex.Text = stus.Sex;
            this.lblAddress.Text = stus.Address;
            this.lblState.Text = stus.UserStateId == 1 ? "有效" : "无效";
        }
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        StudentQueryParameter s = new StudentQueryParameter()
        {
            StudentGuid = this.hfGuid.Value,
        };

        bool rows = iBLL.Del(s.StudentGuid);
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