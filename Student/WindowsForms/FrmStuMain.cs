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
using System.Threading;

namespace Student.WindowsForms
{
    public partial class FrmStuMain : Form
    {
        public FrmStuMain()
        {
            InitializeComponent();
        }

        public FrmStuMain(FrmLogin f1)
        {
            InitializeComponent();

            this.f1 = f1;
        }
        private FrmLogin f1;

        private IBLLStudentSeacher bllstu = new BLLStudentSeacher();

        private int pageMaxRowNumber = 2;
        private int pageNumber = 1;
        private int pageTotalNumber = 0;
        private FrmWaiting fWaiting = null;

        private void btnAdd_Click(object sender, EventArgs e)
        {
            FrmInsert frm = new FrmInsert();

            frm.ShowDialog();
            this.btnSelect.PerformClick();
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            pageNumber = 1;
            fWaiting = new FrmWaiting();
            fWaiting.Location = this.Location;
            fWaiting.Site = this.Site;

            //清除dgvshow
            this.dgvShow.ClearSelection();
            
            ActingLoadAsync();

            if (fWaiting != null)
            {
           
                fWaiting.ShowDialog();
                
            }
        }

        private async void ActingLoadAsync()
        {
            string className = cboClass.Text;
            if (cboClass.Text == "查询所有")
            {
                className = "";
            }
            string sex = cboSex.Text;
            if (cboSex.Text == "查询所有")
            {
                sex = "";
            }
            string stuName = txtName.Text;
            if (txtName.Text == null)
            {
                stuName = "";
            }
            StudentQueryParameter p = new StudentQueryParameter()
            {
                StudentName = stuName,
                ClassName = className,
                Sex = sex,
                PageMaxRowNumber = pageMaxRowNumber,
                PageNumber = pageNumber
            };

            IEnumerable<Students> list = await bllstu.QueryAllAsync(p);

            //await Task.Run(() =>
            //{
            //    System.Threading.Thread.Sleep(3000);
            //});

            await Task.Run(() =>
            {
                this.dgvShow.AutoGenerateColumns = false;
                this.dgvShow.DataSource = list.ToList();
            });

            if (fWaiting != null)
            {
                
                fWaiting.Close();
                fWaiting = null;
            }

            this.pageTotalNumber = p.PageTotalNumber;

            this.llblFirst.Enabled = true;
            this.llblPageUp.Enabled = true;
            this.llblPageDown.Enabled = true;
            this.llblLast.Enabled = true;
            if (pageNumber<=1)
            {
                this.llblPageUp.Enabled = false;
                this.llblFirst.Enabled = false;
            }
            if (pageNumber>= pageTotalNumber)
            {
                this.llblPageDown.Enabled = false;
                this.llblLast.Enabled = false;
            }

            this.lblPage.Text =$"第{pageNumber}页,共{pageTotalNumber.ToString()}页"; 
        }

        private void FrmStuMain_Load(object sender, EventArgs e)
        {
            
            fWaiting = new FrmWaiting();
            fWaiting.Location = this.Location;
            fWaiting.Site = this.Site;



            cboClassLoadAsync();
            if (fWaiting != null)
            {
                fWaiting.ShowDialog();
            }

        }

        private async void cboClassLoadAsync()
        {
            IEnumerable<Class> list = bllstu.QueryClass();
            await Task.Run(() =>
            {
                if (list !=null)
                {
                    foreach (var item in list)
                    {
                        this.cboClass.Items.Add(item.ClassName);
                    }
                }
            });
            if (fWaiting !=null)
            {
                fWaiting.Close();
                fWaiting = null;
            }
        }

        private void tsmiModify_Click(object sender, EventArgs e)
        {
            if (this.dgvShow.SelectedRows.Count > 0)
            {
                string str = (this.dgvShow.SelectedRows[0].DataBoundItem as Students).StudentGuid;
                if (str != null)
                {
                    FrmUpdata frm = new FrmUpdata(str);
                    frm.ShowDialog();
                }
                this.btnSelect.PerformClick();
            }
            else
            {
                MessageBox.Show("没有选择信息");
            }
        }

        private void tsmiDel_Click(object sender, EventArgs e)
        {
            if (this.dgvShow.SelectedRows.Count > 0)
            {
                string str = (this.dgvShow.SelectedRows[0].DataBoundItem as Students).StudentGuid;

                DialogResult dr = MessageBox.Show("是否确定删除？", "删除", MessageBoxButtons.OKCancel);
                if (dr == DialogResult.OK)
                {
                    FrmDelete frm = new FrmDelete(str);
                    frm.ShowDialog();
                }
                this.btnSelect.PerformClick();
            }
            else
            {
                MessageBox.Show("没有选择信息");
            }
        }

        private void tsmiModifyPwd_Click(object sender, EventArgs e)
        {
            if (this.dgvShow.SelectedRows.Count > 0)
            {
                string str = (this.dgvShow.SelectedRows[0].DataBoundItem as Students).StudentGuid;
                if (str != null)
                {
                    FrmUpdatePassword frm = new FrmUpdatePassword(str);
                    frm.ShowDialog();
                }
            }
            else
            {
                MessageBox.Show("没有选择信息");
            }
        }

        private void llblFirst_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            pageNumber = 1;
            ActingLoadAsync();
            if (fWaiting != null)
            {
                fWaiting.ShowDialog();
            }
        }

        private void llblPageUp_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            pageNumber--;
            ActingLoadAsync();
            if (fWaiting != null)
            {
                fWaiting.ShowDialog();
            }
        }

        private void llblPageDown_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            pageNumber++;
            ActingLoadAsync();
            if (fWaiting != null)
            {
                fWaiting.ShowDialog();
            }
        }

        private void llblLast_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            pageNumber = pageTotalNumber;
            ActingLoadAsync();
            if (fWaiting != null)
            {
                fWaiting.ShowDialog();
            }
        }

        private void dgvShow_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            string propertyName = this.dgvShow.Columns[e.ColumnIndex].DataPropertyName;
            if (propertyName.Contains("."))
            {
                var obj = this.dgvShow.Rows[e.RowIndex].DataBoundItem;
                if (obj is Students)
                {
                    string[] name = propertyName.Split('.');
                    if (name[0] == "Class")
                    {
                        if (name[1] == "ClassName")
                        {
                            e.Value = (obj as Students).classs.ClassName;
                        }
                    }
                }
            }
        }

        private void dgvShow_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            Type cellType = this.dgvShow.Columns[e.ColumnIndex].CellType;
            if (cellType == typeof(DataGridViewButtonCell))
            {
                if (this.dgvShow.Columns[e.ColumnIndex].HeaderText =="修改")
                {
                    var temp = this.dgvShow.Rows[e.RowIndex].DataBoundItem;
                    if (temp is Students)
                    {
                        string guid = (temp as Students).StudentGuid;
                        FrmUpdata f = new FrmUpdata(guid);
                        f.ShowDialog();
                        this.btnSelect.PerformClick();
                    }
                }
                else if (this.dgvShow.Columns[e.ColumnIndex].HeaderText=="删除")
                {
                    var temp = this.dgvShow.Rows[e.RowIndex].DataBoundItem;
                    if (temp is Students)
                    {
                        string guid = (temp as Students).StudentGuid;
                        string longId = (temp as Students).LoginId;
                        DialogResult d = MessageBox.Show($"您确认要删除用户{longId}吗？", "确认", MessageBoxButtons.OKCancel);
                        if (d==DialogResult.OK)
                        {
                            FrmDelete f = new FrmDelete(guid);
                            f.ShowDialog();
                            this.btnSelect.PerformClick();
                        }
                    }
                }
                else if(this.dgvShow.Columns[e.ColumnIndex].HeaderText=="修改密码")
                {
                    var temp = this.dgvShow.Rows[e.RowIndex].DataBoundItem;
                    if (temp is Students)
                    {
                        string guid = (temp as Students).StudentGuid;
                        FrmUpdatePassword f = new FrmUpdatePassword(guid);
                        f.ShowDialog();
                    }
                }
            }

        }

        private void FrmStuMain_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
