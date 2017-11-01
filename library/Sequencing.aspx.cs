using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using MyClasses;

public partial class library_Sequencing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["user"] == null)
        //{
        //    Response.Redirect("/Default.aspx");
        //}
    }

    protected void BtnSeSearch_Click(object sender, EventArgs e)
    {
        MVsequencing.ActiveViewIndex = 0;
    }

    protected void SeAdd_Click(object sender, EventArgs e)
    {
        MVsequencing.ActiveViewIndex = 1;
    }


    protected void BtnConfirm_Click(object sender, EventArgs e)
    {
        if (tbprimer.Text.Length > 0)
        {
            SuperConn scnn = new SuperConn("Sequencing.accdb");
            scnn.Open();
            string _sql = "INSERT INTO T_sequencing (S_date, S_orderer, S_vector, S_tag, S_slice, S_length, S_primer, S_type, S_full) VALUES ('" +
                DateTime.Now.ToShortDateString() + "', '" + Session["user"] + "', '" + tbvector.Text + "', '" + tbtag.Text + "', '" + tbslice.Text +
                "', '" + tblength.Text + "', '" + tbprimer.Text + "', '" + tbtype.Text + "', " + cbfull.Checked + ")";
            OleDbCommand cmd = new OleDbCommand(_sql, scnn.cnn);
            Response.Write(_sql);
            int i = cmd.ExecuteNonQuery();
            scnn.Close();
            tbprimer.Text = "";
            if (i > 0)
            {
                SqlDataSourcesequencing.DataBind();
                MVsequencing.ActiveViewIndex = 0;
            }
        }
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        MVsequencing.ActiveViewIndex = 0;
    }

    protected void Page_PreRender(Object sender, EventArgs e)
    {
        string _schcmd = "";
        if (TbSesch.Text.Length > 0)
        {
            _schcmd = " WHERE (S_primer LIKE '%" + TbSesch.Text + "%')";

        }
        string _schsql = "SELECT * FROM T_sequencing" + _schcmd + " ORDER BY [S_id] DESC";
        //Response.Write(_schsql);
        SqlDataSourcesequencing.SelectCommand = _schsql;
    }
}