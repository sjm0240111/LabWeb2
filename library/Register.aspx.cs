using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using MyClasses;

public partial class library_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        if(TbPassword1.Text==TbPassword2.Text)
        {
            SuperConn scnn = new SuperConn("User.accdb");
            scnn.Open();
            string _sql = "INSERT INTO T_user (U_name, U_password, U_truename) VALUES ('" + TbName.Text + "', '" + TbPassword1.Text + "', '"+TbTrueName.Text+"')";
            //Response.Write(_sql);
            OleDbCommand cmd = new OleDbCommand(_sql, scnn.cnn);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                LabelState.Text = "注册成功，等待确认！";

            }
            else
            {
                LabelState.Text = "注册失败！请通知管理员！";
            }

            scnn.Close();
        }
        else
        {
            LabelState.Text = "注册失败，两次输入密码不一致！";
        }
        LabelState.Visible = true;
    }
}