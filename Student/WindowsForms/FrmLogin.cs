using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Student.ModelStu;
using Student.BLL;
using Student.IBLL;
namespace Student.WindowsForms
{
    public partial class FrmLogin : Form
    {
        public FrmLogin()
        {
            InitializeComponent();
        }

        private  IBLLLogin bllLog = new BLLLogin();
        private void btnLogin_Click(object sender, EventArgs e)
        {
            errorProvider1.Clear();
            if (string.IsNullOrWhiteSpace(txtUserName.Text))
            {
                errorProvider1.SetError(txtUserName, "账号不能为空");
                return;

            }
            if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                errorProvider1.SetError(txtPassword, "密码不能为空");
                return;
            }

            User u = new User()
            {
                LoginId = this.txtUserName.Text.Trim(),
                LoginPwd = this.txtPassword.Text.Trim()
            };

            if (bllLog.Login(u))
            {
                FrmStuMain f = new FrmStuMain(this);
                this.Hide();
                f.Show();
            }
            else
            {
                MessageBox.Show("用户名或密码错误！");
            }
        }
    }
}
