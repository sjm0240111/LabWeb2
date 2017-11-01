using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using MyClasses;

public partial class library_Primer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["user"] == null)
        //{
        //    Response.Redirect("/Default.aspx");
        //}
    }

    protected void BtnPrSearch_Click(object sender, EventArgs e)
    {
        MVprimer.ActiveViewIndex = 0;
    }

    protected void PrAdd_Click(object sender, EventArgs e)
    {
        MVprimer.ActiveViewIndex = 1;
    }


    protected void BtnConfirm_Click(object sender, EventArgs e)
    {
        if (tbname.Text.Length > 0)
        {
            SuperConn scnn = new SuperConn("Primer.accdb");
            scnn.Open();
            string _sql = "INSERT INTO T_primer (Pr_date, Pr_orderer, Pr_name, Pr_use, Pr_sequence) VALUES ('" + DateTime.Now.ToShortDateString() + 
                "', '" + Session["user"] + "', '" + tbname.Text + "', '" + tbuse.Text + "', '" + tbsequence.Text + "')";
            OleDbCommand cmd = new OleDbCommand(_sql, scnn.cnn);
            int i = cmd.ExecuteNonQuery();
            scnn.Close();
            tbname.Text = "";
            if (i > 0)
            {
                SqlDataSourceprimer.DataBind();
                MVprimer.ActiveViewIndex = 0;
            }
        }
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        MVprimer.ActiveViewIndex = 0;
    }

    protected void Page_PreRender(Object sender, EventArgs e)
    {
        string _schcmd = "";
        if (TbPrsch.Text.Length > 0)
        {
            _schcmd = " WHERE (Pr_name LIKE '%" + TbPrsch.Text + "%')";

        }
        string _schsql = "SELECT * FROM T_primer" + _schcmd + " ORDER BY [Pr_id] DESC";
        //Response.Write(_schsql);
        SqlDataSourceprimer.SelectCommand = _schsql;
    }

}