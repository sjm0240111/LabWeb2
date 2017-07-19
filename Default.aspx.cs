using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using MyClasses;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        SuperConn scnn = new SuperConn("User.accdb");
        scnn.Open();
        string _sql = "SELECT * FROM T_user WHERE (U_name = '" + TbName.Text + "' AND U_password = '" + TbPassword.Text + "' AND U_valid = True)";
        //Response.Write(_sql);
        OleDbDataReader dr = scnn.GetDataReader(_sql);
        if (dr.Read())
        {
            //Response.Write(_sql);
            Session["user"] = TbName.Text;
           
            Boolean i =Boolean.Parse(dr["U_admin"].ToString());
            if (i)
            {
                Session["admin"] = i;  
            }
            LabelState.Text = "登陆成功！";
        }
        else
        {
            LabelState.Text = "登录失败！";
        }        
        scnn.Close();
        LabelState.Visible = true;
        TbName.Text = TbPassword.Text = "";
    }

    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Library/Register.aspx");
    }

    protected void BtnInsertMsg_Click(object sender, EventArgs e)
    {
        SuperConn scnn = new SuperConn("Message.accdb");
        scnn.Open();
        string _sql = "INSERT INTO T_message (M_name, M_time, M_message, M_visible) VALUES ('" + LabelNameMsg.Text + "', '" + DateTime.Now.ToString() + "', '" + TBTextMsg.Text + "', " + CBvisible.Checked.ToString() + ")";
        //Response.Write(_sql);
        OleDbCommand cmd = new OleDbCommand(_sql, scnn.cnn);
        cmd.ExecuteNonQuery();
        scnn.Close();
        LVmsg.DataBind();
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            divinsertmsg.Visible = true;
            LabelNameMsg.Text = Session["user"].ToString();
        }
    }
}