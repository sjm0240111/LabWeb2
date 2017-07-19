using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using MyClasses;

public partial class library_Antibody : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("/Default.aspx");
        }
        if (Session["admin"] != null)
        {
            Server.Transfer("Antibodyadmin.aspx");
        }
    }

    protected void BtnAbSearch_Click(object sender, EventArgs e)
    {

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