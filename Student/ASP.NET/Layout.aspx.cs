using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Layout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

   public  void IterateThroughChildren(Control parent)
    {
        string s = null;
        foreach (Control c in parent.Controls)
        {
            if (c.ToString() == "System.Web.UI.WebControls.TextBox")//判断是否为textbox控件
            {
               
                {
                    (c as TextBox).BackColor = System.Drawing.Color.Red;
                }

            }

            if (c.ToString() == "System.Web.UI.WebControls.Label")//判断是否为textbox控件
            {
               
                {
                    (c as Label).BackColor = System.Drawing.Color.Red;
                }

            }
            if (c.Controls.Count > 0)       // 判断该控件是否有下属控件。
            {

                IterateThroughChildren(c);    //递归，访问该控件的下属控件集。

            }
        }
    }
}