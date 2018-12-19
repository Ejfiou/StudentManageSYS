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
    public partial class FrmInsert : Form
    {
        public FrmInsert()
        {
            InitializeComponent();
        }

        private IBLLStudentSeacher bllSear = new BLLStudentSeacher();

        private void btnInsert_Click(object sender, EventArgs e)
        {
            this.errorProvider1.Clear();
            string loginId = txtLoginID.Text.Trim();
            if (string.IsNullOrWhiteSpace(txtLoginID.Text))
            {
                this.errorProvider1.SetError(txtLoginID, "不能为空");
                return;
            }
           
            string loginPwd = txtLoginPwd.Text.Trim();
            if (string.IsNullOrWhiteSpace(txtLoginPwd.Text))
            {
                this.errorProvider1.SetError(txtLoginPwd, "不能为空");
                return;
            }
           
            string stuNo = txtStuNo.Text.Trim();
            if (string.IsNullOrWhiteSpace(txtStuNo.Text))
            {
                this.errorProvider1.SetError(txtStuNo, "不能为空");
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
                return;
            }

            string classGuid = (this.cboClass.SelectedItem as Class).ClassGuid;
            Students stu = new Students()
            {
                LoginId = loginId,
                LoginPwd = loginPwd,
                StudentNO = stuNo,
                Sex = sex,
                StudentName = name,
                Address = address,
                ClassGuid = classGuid
            };

            if (bllSear.Insert(stu))
            {

                MessageBox.Show("增加成功");
                this.Close();
            }
            else
            {
                MessageBox.Show("增加失败");
            }
        
        }

        private void FrmInsert_Load(object sender, EventArgs e)
        {
            this.cboClass.DisplayMember = "ClassName";
            this.cboClass.ValueMember = "ClassGuid";
            IEnumerable<Class> list = bllSear.QueryClass();
            this.cboClass.DataSource = list.ToList();
            this.cboClass.Text = null;
        }
    }
}
