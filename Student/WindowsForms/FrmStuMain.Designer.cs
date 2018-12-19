namespace Student.WindowsForms
{
    partial class FrmStuMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnSelect = new System.Windows.Forms.Button();
            this.cboClass = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cboSex = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtName = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.tmsMain = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.tsmiModify = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiDel = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiModifyPwd = new System.Windows.Forms.ToolStripMenuItem();
            this.dgvShow = new System.Windows.Forms.DataGridView();
            this.llblLast = new System.Windows.Forms.LinkLabel();
            this.llblFirst = new System.Windows.Forms.LinkLabel();
            this.llblPageUp = new System.Windows.Forms.LinkLabel();
            this.llblPageDown = new System.Windows.Forms.LinkLabel();
            this.lblPage = new System.Windows.Forms.Label();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column7 = new System.Windows.Forms.DataGridViewButtonColumn();
            this.Column9 = new System.Windows.Forms.DataGridViewButtonColumn();
            this.Column8 = new System.Windows.Forms.DataGridViewButtonColumn();
            this.tmsMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvShow)).BeginInit();
            this.SuspendLayout();
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(360, 99);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(75, 23);
            this.btnAdd.TabIndex = 16;
            this.btnAdd.Text = "增加学生";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnSelect
            // 
            this.btnSelect.Location = new System.Drawing.Point(360, 15);
            this.btnSelect.Name = "btnSelect";
            this.btnSelect.Size = new System.Drawing.Size(75, 23);
            this.btnSelect.TabIndex = 15;
            this.btnSelect.Text = "查询";
            this.btnSelect.UseVisualStyleBackColor = true;
            this.btnSelect.Click += new System.EventHandler(this.btnSelect_Click);
            // 
            // cboClass
            // 
            this.cboClass.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboClass.FormattingEnabled = true;
            this.cboClass.Items.AddRange(new object[] {
            "查询所有"});
            this.cboClass.Location = new System.Drawing.Point(126, 107);
            this.cboClass.Name = "cboClass";
            this.cboClass.Size = new System.Drawing.Size(121, 20);
            this.cboClass.TabIndex = 14;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(31, 110);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(89, 12);
            this.label3.TabIndex = 13;
            this.label3.Text = "通过班级查询：";
            // 
            // cboSex
            // 
            this.cboSex.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboSex.FormattingEnabled = true;
            this.cboSex.Items.AddRange(new object[] {
            "男",
            "女",
            "查询所有"});
            this.cboSex.Location = new System.Drawing.Point(126, 59);
            this.cboSex.Name = "cboSex";
            this.cboSex.Size = new System.Drawing.Size(121, 20);
            this.cboSex.TabIndex = 12;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(31, 67);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(89, 12);
            this.label2.TabIndex = 11;
            this.label2.Text = "通过性别查询：";
            // 
            // txtName
            // 
            this.txtName.Location = new System.Drawing.Point(126, 12);
            this.txtName.Name = "txtName";
            this.txtName.Size = new System.Drawing.Size(140, 21);
            this.txtName.TabIndex = 10;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(31, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 12);
            this.label1.TabIndex = 9;
            this.label1.Text = "通过姓名查询：";
            // 
            // tmsMain
            // 
            this.tmsMain.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiModify,
            this.tsmiDel,
            this.tsmiModifyPwd});
            this.tmsMain.Name = "contextMenuStrip1";
            this.tmsMain.Size = new System.Drawing.Size(125, 70);
            // 
            // tsmiModify
            // 
            this.tsmiModify.Name = "tsmiModify";
            this.tsmiModify.Size = new System.Drawing.Size(124, 22);
            this.tsmiModify.Text = "修改";
            this.tsmiModify.Click += new System.EventHandler(this.tsmiModify_Click);
            // 
            // tsmiDel
            // 
            this.tsmiDel.Name = "tsmiDel";
            this.tsmiDel.Size = new System.Drawing.Size(124, 22);
            this.tsmiDel.Text = "删除";
            this.tsmiDel.Click += new System.EventHandler(this.tsmiDel_Click);
            // 
            // tsmiModifyPwd
            // 
            this.tsmiModifyPwd.Name = "tsmiModifyPwd";
            this.tsmiModifyPwd.Size = new System.Drawing.Size(124, 22);
            this.tsmiModifyPwd.Text = "修改密码";
            this.tsmiModifyPwd.Click += new System.EventHandler(this.tsmiModifyPwd_Click);
            // 
            // dgvShow
            // 
            this.dgvShow.AllowUserToAddRows = false;
            this.dgvShow.AllowUserToDeleteRows = false;
            this.dgvShow.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvShow.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.Column2,
            this.Column3,
            this.Column4,
            this.Column5,
            this.Column6,
            this.Column7,
            this.Column9,
            this.Column8});
            this.dgvShow.ContextMenuStrip = this.tmsMain;
            this.dgvShow.Location = new System.Drawing.Point(2, 133);
            this.dgvShow.MultiSelect = false;
            this.dgvShow.Name = "dgvShow";
            this.dgvShow.ReadOnly = true;
            this.dgvShow.RowTemplate.Height = 23;
            this.dgvShow.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvShow.Size = new System.Drawing.Size(673, 183);
            this.dgvShow.TabIndex = 19;
            this.dgvShow.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvShow_CellContentClick);
            this.dgvShow.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgvShow_CellFormatting);
            // 
            // llblLast
            // 
            this.llblLast.AutoSize = true;
            this.llblLast.Enabled = false;
            this.llblLast.Location = new System.Drawing.Point(396, 330);
            this.llblLast.Name = "llblLast";
            this.llblLast.Size = new System.Drawing.Size(53, 12);
            this.llblLast.TabIndex = 28;
            this.llblLast.TabStop = true;
            this.llblLast.Text = "最后一页";
            this.llblLast.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llblLast_LinkClicked);
            // 
            // llblFirst
            // 
            this.llblFirst.AutoSize = true;
            this.llblFirst.Enabled = false;
            this.llblFirst.Location = new System.Drawing.Point(161, 330);
            this.llblFirst.Name = "llblFirst";
            this.llblFirst.Size = new System.Drawing.Size(41, 12);
            this.llblFirst.TabIndex = 27;
            this.llblFirst.TabStop = true;
            this.llblFirst.Text = "第一页";
            this.llblFirst.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llblFirst_LinkClicked);
            // 
            // llblPageUp
            // 
            this.llblPageUp.AutoSize = true;
            this.llblPageUp.Enabled = false;
            this.llblPageUp.Location = new System.Drawing.Point(243, 330);
            this.llblPageUp.Name = "llblPageUp";
            this.llblPageUp.Size = new System.Drawing.Size(41, 12);
            this.llblPageUp.TabIndex = 26;
            this.llblPageUp.TabStop = true;
            this.llblPageUp.Text = "上一页";
            this.llblPageUp.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llblPageUp_LinkClicked);
            // 
            // llblPageDown
            // 
            this.llblPageDown.AutoSize = true;
            this.llblPageDown.Enabled = false;
            this.llblPageDown.Location = new System.Drawing.Point(315, 330);
            this.llblPageDown.Name = "llblPageDown";
            this.llblPageDown.Size = new System.Drawing.Size(41, 12);
            this.llblPageDown.TabIndex = 25;
            this.llblPageDown.TabStop = true;
            this.llblPageDown.Text = "下一页";
            this.llblPageDown.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llblPageDown_LinkClicked);
            // 
            // lblPage
            // 
            this.lblPage.AutoSize = true;
            this.lblPage.ForeColor = System.Drawing.Color.Red;
            this.lblPage.Location = new System.Drawing.Point(563, 330);
            this.lblPage.Name = "lblPage";
            this.lblPage.Size = new System.Drawing.Size(0, 12);
            this.lblPage.TabIndex = 29;
            // 
            // Column1
            // 
            this.Column1.DataPropertyName = "LoginId";
            this.Column1.HeaderText = "账号";
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            this.Column1.Width = 70;
            // 
            // Column2
            // 
            this.Column2.DataPropertyName = "Class.ClassName";
            this.Column2.HeaderText = "班级";
            this.Column2.Name = "Column2";
            this.Column2.ReadOnly = true;
            this.Column2.Width = 70;
            // 
            // Column3
            // 
            this.Column3.DataPropertyName = "StudentNO";
            this.Column3.HeaderText = "学号";
            this.Column3.Name = "Column3";
            this.Column3.ReadOnly = true;
            this.Column3.Width = 70;
            // 
            // Column4
            // 
            this.Column4.DataPropertyName = "StudentName";
            this.Column4.HeaderText = "姓名";
            this.Column4.Name = "Column4";
            this.Column4.ReadOnly = true;
            this.Column4.Width = 70;
            // 
            // Column5
            // 
            this.Column5.DataPropertyName = "Sex";
            this.Column5.HeaderText = "性别";
            this.Column5.Name = "Column5";
            this.Column5.ReadOnly = true;
            this.Column5.Width = 70;
            // 
            // Column6
            // 
            this.Column6.DataPropertyName = "Address";
            this.Column6.HeaderText = "地址";
            this.Column6.Name = "Column6";
            this.Column6.ReadOnly = true;
            this.Column6.Width = 70;
            // 
            // Column7
            // 
            this.Column7.HeaderText = "修改";
            this.Column7.Name = "Column7";
            this.Column7.ReadOnly = true;
            this.Column7.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.Column7.Text = "修改";
            this.Column7.UseColumnTextForButtonValue = true;
            this.Column7.Width = 70;
            // 
            // Column9
            // 
            this.Column9.HeaderText = "修改密码";
            this.Column9.Name = "Column9";
            this.Column9.ReadOnly = true;
            this.Column9.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Column9.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.Column9.Text = "修改密码";
            this.Column9.UseColumnTextForButtonValue = true;
            this.Column9.Width = 80;
            // 
            // Column8
            // 
            this.Column8.HeaderText = "删除";
            this.Column8.Name = "Column8";
            this.Column8.ReadOnly = true;
            this.Column8.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Column8.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.Column8.Text = "删除";
            this.Column8.UseColumnTextForButtonValue = true;
            this.Column8.Width = 60;
            // 
            // FrmStuMain
            // 
            this.AcceptButton = this.btnSelect;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(677, 351);
            this.Controls.Add(this.lblPage);
            this.Controls.Add(this.llblLast);
            this.Controls.Add(this.llblFirst);
            this.Controls.Add(this.llblPageUp);
            this.Controls.Add(this.llblPageDown);
            this.Controls.Add(this.dgvShow);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.btnSelect);
            this.Controls.Add(this.cboClass);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cboSex);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtName);
            this.Controls.Add(this.label1);
            this.Name = "FrmStuMain";
            this.Text = "学生信息管理";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.FrmStuMain_FormClosed);
            this.Load += new System.EventHandler(this.FrmStuMain_Load);
            this.tmsMain.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvShow)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnSelect;
        private System.Windows.Forms.ComboBox cboClass;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cboSex;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtName;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ContextMenuStrip tmsMain;
        private System.Windows.Forms.ToolStripMenuItem tsmiModify;
        private System.Windows.Forms.ToolStripMenuItem tsmiDel;
        private System.Windows.Forms.ToolStripMenuItem tsmiModifyPwd;
        private System.Windows.Forms.DataGridView dgvShow;
        private System.Windows.Forms.LinkLabel llblLast;
        private System.Windows.Forms.LinkLabel llblFirst;
        private System.Windows.Forms.LinkLabel llblPageUp;
        private System.Windows.Forms.LinkLabel llblPageDown;
        private System.Windows.Forms.Label lblPage;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column4;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column5;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column6;
        private System.Windows.Forms.DataGridViewButtonColumn Column7;
        private System.Windows.Forms.DataGridViewButtonColumn Column9;
        private System.Windows.Forms.DataGridViewButtonColumn Column8;
    }
}