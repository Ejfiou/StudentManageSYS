using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Student.IBLL;
using Student.BLL;
using Student.ModelStu;
using System.Text.RegularExpressions;
using System.IO;
using System.Text;
using System.Web.SessionState;
public partial class Login : System.Web.UI.Page
{
    private IBLLLogin bllLog = new BLLLogin();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack)//第一次访问
        {

        }
        else //不是第一次访问
        {
            //判断是否为已经登录
            //读取cookie
            HttpCookie cookClient = this.Request.Cookies.Get("LoginId");

            if (cookClient != null)
            {
                this.Response.Write("<script> alert('欢迎再次登录!用户：" + cookClient.Value + "您可直接进入'); window.location.href = 'StudentMain.aspx';  </script>");
                return;
            }

            this.lblTotalCount.Text = $"欢迎光临！您是第{this.Application["totalCount"].ToString()}个访问该网站";
        }
    }

    protected void btnLog_Click(object sender, EventArgs e)
    {
        //string txtUserName = this.Request["txtUserName"];
        //string txtUserPwd = this.Request["txtUserPwd"];
        //string remember = this.Request["remember"];
        //string txtVerificationCode = this.Request["txtVerificationCode"];

        string txtUserName = this.txtUserName.Text;
        string txtUserPwd = this.txtUserPwd.Text;
        bool isRemember = this.remember.Checked;
        string txtVerificationCode = this.txtVerificationCode.Text;

        //验证数据
        //if (string.IsNullOrWhiteSpace(txtUserName))
        //{
        //    this.Response.Write("<script> alert('用户名不能为空'); window.history.go(-1); $('#txtUserName').focus(); </script>");
        //    return;
        //}
        //if (string.IsNullOrWhiteSpace(txtUserPwd))
        //{
        //    this.Response.Write("<script> alert('密码不能为空'); window.history.go(-1);  $('#txtUserPwd').focus();</script>");
        //    return;
        //}

        //if (!Regex.IsMatch(txtUserName.Trim(), @"^\w{2,}$"))
        //{
        //    this.Response.Write("<script> alert('至少两个连续字符'); window.history.go(-1); $('#txtUserName').focus(); </script>");
        //    return;
        //}

        ////验证验证码
        //if (string.IsNullOrWhiteSpace(txtVerificationCode))
        //{
        //    this.Response.Write("<script> alert('验证码不能为空'); window.history.go(-1); $('#txtVerificationCode').focus(); </script>");
        //    return;
        //}

        //使用验证控件进行后台验证
        this.Validate();
        if (!this.IsValid)
        {
            return;
        }

        object obj = this.Session["Code"];
        if (obj == null || string.IsNullOrWhiteSpace((obj.ToString())))
        {
            this.Response.Write("<script> alert('验证码有问题'); window.history.go(-1); </script>");
            return;
        }

        if (obj.ToString() != txtVerificationCode.ToUpper())
        {
            this.Response.Write("<script> alert('验证码错误'); window.history.go(-1); $('#txtVerificationCode').focus(); </script>");
            return;
        }


        //组装对象
        User u = new User()
        {
            LoginId = txtUserName.Trim(),
            LoginPwd = txtUserPwd.Trim(),
        
        };

        string result = "";
        if (bllLog.Login(u))
        {
            //result = "成功！";
            //context.Response.Redirect("StuMain.html");
            //记住我
            //设置cookice
            if (isRemember)
            {
                HttpCookie cook = new HttpCookie("LoginId", u.LoginId);
                cook.Expires = DateTime.Now.AddMinutes(1);//时间
                this.Response.Cookies.Add(cook);
            }

            //设置 session
            this.Session.Add("LoginIdUser", u);

            // this.Response.Redirect("StudentMain.aspx");
            this.Response.Redirect("Home.aspx");
        }
        else
        {
            result = "用户名或密码不正确！";
            this.Response.Write("<script> alert('" + result + "'); window.history.go(-1); </script>");
        }
    }
}