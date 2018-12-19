using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Student.IBLL;
using Student.BLL;
using Student.ModelStu;
public partial class Register : System.Web.UI.Page
{
    private IBLLAdmin iBLLAdmin = new BLLAdmin();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        //string txtUserName = this.Request["txtUserName"];
        //string txtReUserPwd = this.Request["txtReUserPwd"];
        string txtUserName = this.txtUserName.Text;
        string txtReUserPwd = this.txtReUserPwd.Text;

        //验证数据
        this.Validate();
        if (!this.IsValid)
        {
            return;
        }

        //组装对象
        User user = new User()
        {
            Guid = Guid.NewGuid().ToString(),
            LoginId = txtUserName,
            LoginPwd = txtReUserPwd
        };

        if (iBLLAdmin.Add(user))
        {
            this.Response.Write("<script> alert('操作成功！'); window.location.href = 'Login.aspx'; </script>");
        }
        else
        {
            this.Response.Write("<script> alert('操作失败！'); window.history.go(-1); </script>");
        }
    }
}