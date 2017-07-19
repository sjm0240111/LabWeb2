using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using MyClasses;

public partial class library_Antibodyadmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("/Default.aspx");
        }
        if (Session["admin"] == null)
        {
            Server.Transfer("Antibody.aspx");
        }
    }

    protected void BtnAbSearch_Click(object sender, EventArgs e)
    {
        MVantibody.ActiveViewIndex = 0;
    }

    protected void AbAdd_Click(object sender, EventArgs e)
    {
        MVantibody.ActiveViewIndex = 1;
    }


    protected void BtnConfirm_Click(object sender, EventArgs e)
    {
        if (tbname.Text.Length > 0)
        {
            SuperConn scnn = new SuperConn("Antibody.accdb");
            scnn.Open();
            string _sql = "INSERT INTO T_Antibody (A_no, A_name, A_background) VALUES ('" + tbitem.Text + "', '" + tbname.Text + "', '" + tbbackground.Text + "')";
            OleDbCommand cmd = new OleDbCommand(_sql, scnn.cnn);
            int i = cmd.ExecuteNonQuery();
            scnn.Close();
            tbname.Text = "";
            if (i > 0)
            {
                SqlDataSourceantibody.DataBind();
                MVantibody.ActiveViewIndex = 0;
            }
        }
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        MVantibody.ActiveViewIndex = 0;
    }

    protected void Page_PreRender(Object sender, EventArgs e)
    {
        string _schcmd = "";
        if (TbAbsch.Text.Length > 0)
        {
            _schcmd = " WHERE (A_name LIKE '%" + TbAbsch.Text + "%')";

        }
        string _schsql = "SELECT * FROM T_antibody" + _schcmd + " ORDER BY [A_id] DESC";
        //Response.Write(_schsql);
        SqlDataSourceantibody.SelectCommand = _schsql;
    }
}