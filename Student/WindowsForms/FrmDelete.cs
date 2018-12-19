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
    public partial class FrmDelete : Form
    {
        public FrmDelete()
        {
            InitializeComponent();
        }

        public FrmDelete(string stuGuid)
        {
            InitializeComponent();
            this.stuGuid = stuGuid;
        }

        private string stuGuid= null;

        private IBLLStudentSeacher bllSear = new BLLStudentSeacher();

        private void btnDel_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(stuGuid))
            {
                MessageBox.Show("该页面有问题,无法进行删除！");
                return;
            }
            if (bllSear.Del(stuGuid))
            {
                MessageBox.Show("删除成功");
                this.Close();
            }
            else
            {
                MessageBox.Show("删除失败");
            }
        }

        private void FrmDelete_Load(object sender, EventArgs e)
        {
            StudentQueryParameter p = new StudentQueryParameter()
            {
                StudentGuid = stuGuid
            };
            IEnumerable<Students> list = bllSear.QueryByStuGuid(p);

            foreach (var item in list)
            {
                this.lblName.Text = item.StudentName;
                this.lblStuNo.Text = item.StudentNO;
                this.lblSex.Text = item.Sex;
                this.lblAddress.Text = item.Address;
                this.lblClass.Text = item.ClassName;
                this.lblState.Text = item.UserStateId == 1 ? "在线" : "离线";
                this.lblId.Text = item.LoginId;
            }
        }
    }
}
