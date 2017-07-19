using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using MyClasses;

public partial class test_testlistview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void MarkDelete(Object s,CommandEventArgs e)
    {
        //Response.Write(e.CommandArgument.ToString());
        SuperConn scnn = new SuperConn("OrderData.accdb");
        scnn.Open();
        string _sql = "UPDATE T_order SET O_delete=True WHERE O_id=" + e.CommandArgument.ToString();
        OleDbCommand cmd = new OleDbCommand(_sql, scnn.cnn);
        cmd.ExecuteNonQuery();
        scnn.Close();
        lvorder.DataBind();
     
    }
}