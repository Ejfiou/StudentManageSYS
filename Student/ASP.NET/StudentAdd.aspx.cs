using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Student.IBLL;
using Student.BLL;
using Student.ModelStu;

public partial class StudentAdd : System.Web.UI.Page
{
    private IBLLStudentSeacher iBLL = new BLLStudentSeacher();
    protected void Page_Load(object sender, EventArgs e)
    {
        //for (int i = 0; i < Page.Controls.Count; i++)  //master中所有控件
        //{
        //    foreach (Control conn in Page.Controls[i].Controls)//在master中遍历，寻找ContentPlaceHolder
        //    {
        //        foreach (Control con in conn.Controls)//在ContentPlaceHolder中遍历，寻找HtmlForm
        //        {
        //            foreach (Control c in con.Controls)//在HtmlForm中遍历，寻找控件
        //            {

        //                if (c.GetType().Name.Equals("Button"))
        //                {
        //                    s += (c as Button).ID + " ";
        //                }
        //                if (c.GetType().Name.Equals("Label"))
        //                {
        //                    s += (c as Label).ID + " ";
        //                }
        //                if (c.GetType().Name.Equals("TextBox"))
        //                {
        //                    s += (c as TextBox).ID + " ";
        //                }


        //            }
        //        }
        //    }

        //}



        
        if (!this.IsPostBack)
        {
            

            this.cboClassGuid.AppendDataBoundItems = true;
            this.cboClassGuid.DataSource = iBLL.QueryClass().ToList();
            this.cboClassGuid.DataTextField = "ClassName";
            this.cboClassGuid.DataValueField = "ClassGuid";
            this.cboClassGuid.DataBind();
           

        }
    }


    //void IterateThroughChildren(Control parent)
    //{
    //    string s = null;
    //    foreach (Control c in parent.Controls)
    //    {
    //        if (c.ToString() == "System.Web.UI.WebControls.TextBox")//判断是否为textbox控件
    //        {
    //            if ((c as TextBox).ID == this.txtAddress.ID)
    //            {
    //                (c as TextBox).BackColor = System.Drawing.Color.Red;
    //            }
               
    //        }

    //        if (c.ToString() == "System.Web.UI.WebControls.Label")//判断是否为textbox控件
    //        {
    //            if ((c as Label).ID == this.Label1.ID)
    //            {
    //                (c as Label).BackColor = System.Drawing.Color.Red;
    //            }
               
    //        }
    //        if (c.Controls.Count > 0)       // 判断该控件是否有下属控件。
    //        {

    //            IterateThroughChildren(c);    //递归，访问该控件的下属控件集。

    //        }
    //    }
    //}


    protected void btnInsert_Click(object sender, EventArgs e)
    {
        this.Validate();
        if (!this.IsValid)
        {
            return;
        }
        
        Students student = new Students()
        {
            LoginId = txtUserName.Text.Trim(),
            StudentGuid = Guid.NewGuid().ToString(),
            LoginPwd = txtUserPwd.Text.Trim(),
            Sex = this.rdoMale.Checked?rdoMale.Text:rdoFamel.Text,
            UserStateId = Convert.ToInt32(string.IsNullOrWhiteSpace(this.cboState.SelectedValue) ? "0" : cboState.SelectedValue.Trim()),
            StudentName = txtName.Text.Trim(),
            ClassGuid = string.IsNullOrWhiteSpace(cboClassGuid.SelectedValue.Trim()) ? null : cboClassGuid.SelectedValue.Trim(),
            StudentNO = txtStuNo.Text.Trim(),
            Address = txtAddress.Text.Trim()
        };

        bool rows = iBLL.Insert(student);
        if (rows)
        {
            this.Response.Write("<script> alert('操作成功！'); window.opener.document.getElementById('cphContent_btnQuery').click(); window.close();</script>");
        }
        else
        {
            this.Response.Write("<script>alert('操作失败！');Window.history.go(-1);</script>");
        }
    }
}