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
using Student.ModelStuView;
using Student.IBLL;
namespace Student.WindowsForms
{
    public partial class FrmUpdata : Form
    {
        public FrmUpdata()
        {
            InitializeComponent();
        }

        public FrmUpdata(string stuGuid)
        {
            this.stuGuid = stuGuid;
            InitializeComponent();
        }

        string stuGuid = null;

        private IBLLStudentSeacher bllSear = new BLLStudentSeacher();


        private void btnInsert_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(stuGuid))
            {
                MessageBox.Show("该页面有问题,无法进行修改！");
                return;
            }
            this.errorProvider1.Clear();
            string loginId = txtLoginID.Text.Trim();
            if (string.IsNullOrWhiteSpace(txtLoginID.Text))
            {
                this.errorProvider1.SetError(txtLoginID, "不能为空");
                return;
            }

            string stuNo = txtStuID.Text.Trim();
            if (string.IsNullOrWhiteSpace(txtStuID.Text))
            {
                this.errorProvider1.SetError(txtStuID, "不能为空");
                return;
            }

            string sex = rdoMale.Checked ? rdoMale.Text : rdoFamel.Text;
            string name = txtName.Text.Trim();
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                this.errorProvider1.SetError(txtName, "不能为空");
                return;
            }

            string address = txtAddress.Text.Trim();
            if (string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                this.errorProvider1.SetError(txtAddress, "不能为空");
                return;
            }

            string classChoice = cboClass.Text;
            if (string.IsNullOrWhiteSpace(cboClass.Text))
            {
                this.errorProvider1.SetError(cboClass, "不能为空");
            }
            string userState = cboStates.Text;
            if (string.IsNullOrWhiteSpace(cboStates.Text))
            {
                this.errorProvider1.SetError(cboStates, "不能为空");
            }


            string classGuid = (this.cboClass.SelectedItem as Class).ClassGuid;
            Students stu = new Students()
            {
                LoginId = loginId,
                StudentNO = stuNo,
                Sex = sex,
                StudentName = name,
                Address = address,
                ClassGuid = classGuid,
                StudentGuid = stuGuid,
                UserStateId = userState == "在线" ? 1 : 0
            };

            if (bllSear.Updata(stu))
            {
                MessageBox.Show("修改成功");
                this.Close();
            }
            else
            {
                MessageBox.Show("修改失败");
            }
        }

        private void FrmUpdata_Load(object sender, EventArgs e)
        {
            this.cboClass.DisplayMember = "ClassName";
            this.cboClass.ValueMember = "ClassGuid";
            IEnumerable<Class> list = bllSear.QueryClass();
            this.cboClass.DataSource = list.ToList();

            StudentQueryParameter p = new StudentQueryParameter()
            {
                StudentGuid = stuGuid
            };
            IEnumerable<Students> stu = bllSear.QueryByStuGuid(p);

            foreach (var item in stu)
            {
                this.txtLoginID.Text = item.LoginId;
                this.txtName.Text = item.StudentName;
                this.txtStuID.Text = item.StudentNO;
                this.txtAddress.Text = item.Address;
                this.cboStates.Text = item.UserStateId == 1 ? "在线" : "离线";
                this.rdoMale.Checked = item.Sex == rdoMale.Text;
                this.rdoFamel.Checked = item.Sex == rdoFamel.Text;
                this.cboClass.Text = item.ClassName;
            }
        }
    }
}
