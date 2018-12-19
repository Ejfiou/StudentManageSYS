using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Student.ModelStuView;
using Student.ModelStu;
using Student.IBLL;
using Student.BLL;

public partial class Layout : System.Web.UI.MasterPage
{
    public IBLLStudentSeacher iBLL = new BLLStudentSeacher();

    protected void Page_Load(object sender, EventArgs e)
    {
        object obj = this.Session["LoginIdUser"];
        if (obj == null && !(obj is User))
        {
            this.Response.Write("<script> alert('非法登录，请从登录页面进行'); window.location.href = 'Login.aspx';  </script>");
            return;
        }

        //User currentAdmin = obj as User;

        this.lblLoginId.Text = "欢迎" + (obj as User).LoginId;
    }
}
