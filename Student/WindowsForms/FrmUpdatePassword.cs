using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Student.BLL;
using Student.ModelStuView;
using Student.IBLL;
namespace Student.WindowsForms
{
    public partial class FrmUpdatePassword : Form
    {
        public FrmUpdatePassword()
        {
            InitializeComponent();
        }

        private IBLLStudentSeacher bllSear = new BLLStudentSeacher();
        public FrmUpdatePassword(string stuGuid)
        {
            InitializeComponent();
            this.stuGuid = stuGuid;
        }
        private string stuGuid = null;

        private string oldPwd = null;
        private void FrmUpdatePassword_Load(object sender, EventArgs e)
        {
            StudentQueryParameter p = new StudentQueryParameter()
            {
                StudentGuid = stuGuid
            };
            oldPwd = bllSear.QueryByStuGuid(p).ToString();
        }

        private void btnUpdata_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(stuGuid))
            {
                MessageBox.Show("该页面有问题,无法进行修改！");
                return;
            }
            this.errorProvider1.Clear();
            if (txtOldPwd.Text.Length == 0)
            {
                this.errorProvider1.SetError(txtOldPwd, "不能为空");
                return;
            }
            if (txtNewPwd.Text.Length == 0)
            {
                this.errorProvider1.SetError(txtNewPwd, "不能为空");
                return;
            }
            if (txtOkPwd.Text.Length == 0)
            {
                this.errorProvider1.SetError(txtOkPwd, "不能为空");
                return;
            }
            if (txtNewPwd.Text != txtOkPwd.Text)
            {
                MessageBox.Show("两次密码输入不一致");
                return;
            }
            if (txtOldPwd.Text != oldPwd)
            {
                MessageBox.Show("旧密码输入错误");
                return;
            }

            if (bllSear.UpdataPwd(stuGuid,txtNewPwd.Text))
            {
                MessageBox.Show("修改密码成功");
                this.Close();
            }
            else
            {
                MessageBox.Show("修改密码失败");
            }
        }
    }
}
