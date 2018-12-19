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
using System.Web.SessionState;

public partial class ModifyPassword : System.Web.UI.Page
{
    private IBLLAdmin ibll = new BLLAdmin();
    object obj = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = this.Session["LoginIdUser"];
        if (obj == null && !(obj is User))
        {
            this.Response.Write("<script> alert('非法登录，请从登录页面登录'); window.location.href = 'LoginHandler.ashx';  </script>");
            return;
        }
    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        string txtOldPwd = this.txtOldPwd.Text;
        string txtRePwd = this.txtRePwd.Text;
        string txtNewPwd = this.txtNewPwd.Text;

        this.Validate();
        if (!this.IsValid)
        {
            return;
        }

        StudentQueryParameter p = new StudentQueryParameter()
        {
            StudentGuid = (obj as User).Guid
        };


        string oldPwd = ibll.QueryByStuGuid(p).ToList()[0].LoginPwd;

       // string oldPwd = (ibll.QueryByStuGuid(p) as User).LoginPwd;

        if (oldPwd != txtOldPwd)
        {
            this.Response.Write("<script> alert('旧密码错误！');window.history.go(-1); </script>");
            return;
        }

        if (ibll.UpdataPwd((obj as User).Guid, txtRePwd))
        {
            this.Response.Write("<script> alert('操作成功！'); window.location.href = 'StudentMain.aspx'; </script>");
        }
        else
        {
            this.Response.Write("<script> alert('操作失败！'); window.history.go(-1); </script>");
        }
    }
}