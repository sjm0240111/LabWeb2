using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class library_Plasmid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("/Default.aspx");
        }
    }

    protected void BtnPlSearch_Click(object sender, EventArgs e)
    {

    }
    protected void Page_PreRender(object sender,EventArgs e)
    {
        string _schcmd = "";
        foreach (Control _ctl in divrbs.Controls)
        {
            if (_ctl is RadioButton)
            {
                RadioButton _rb = (RadioButton)_ctl;
                if (_rb.Checked)
                {
                    _schcmd = " WHERE (" + _rb.ID + " LIKE '%" + TbPlsch.Text + "%')";
                }
            }
        }
        string _schsql = "SELECT * FROM T_plasmid" + _schcmd + " ORDER BY P_id DESC";
        //Response.Write(_schsql);
        SDSplasmid.SelectCommand = _schsql;
    }
}