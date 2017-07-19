using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using MyClasses;

public partial class Library_testlistview : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void BtnOrder_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }

    protected void BtnConfirm_Click(object sender, EventArgs e)
    {
        if(tbname.Text.Length>0)
        {
            SuperConn scnn = new SuperConn("OrderData.accdb");
            scnn.Open();
            string _sql = "INSERT INTO T_order (O_ordertime, O_orderer, O_name, O_brand, O_item, O_number, O_note, O_edit) VALUES ('" + DateTime.Now.ToShortDateString() + "', '" + tborderer.Text + "', '" + tbname.Text + "', '" + tbbrand.Text + "', '" + tbitem.Text + "', '" + tbnumber.Text + "', '" + tbnote.Text + "', TRUE)";
            OleDbCommand cmd = new OleDbCommand(_sql, scnn.cnn);
            int i = cmd.ExecuteNonQuery();
            scnn.Close();
            tbname.Text = "";
            if(i>0)
            {
                lvorder.DataBind();
                MultiView1.ActiveViewIndex = 1;
            }          
        }
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void MarkDelete(Object s, CommandEventArgs e)
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

    protected void ReOrder(object s, CommandEventArgs e)
    {
        SuperConn scnn = new SuperConn("OrderData.accdb");
        scnn.Open();
        string _sql = "SELECT * FROM T_order WHERE O_id="+e.CommandArgument.ToString();
        OleDbDataReader dr = scnn.GetDataReader(_sql);
        dr.Read();
        try
        { 
            tbname.Text = dr["O_name"].ToString();
            tbbrand.Text = dr["O_brand"].ToString();
            tbitem.Text = dr["O_item"].ToString();
            tbnumber.Text = dr["O_number"].ToString();
        }
        catch { }
        scnn.Close();
        MultiView1.ActiveViewIndex = 0;

    }

    protected void Page_PreRender(Object sender,EventArgs e)
    {
        string _schcmd = " WHERE (O_delete = FALSE)";
        foreach (Control chk in divrbs.Controls)
        {
            if (chk is RadioButton)
            {
                RadioButton _rb = (RadioButton)chk;
                if (_rb.Checked) { _schcmd = " WHERE (" + _rb.ID + " LIKE '%" + tbsch.Text + "%' AND O_delete = FALSE)"; }
            }
        }
        string _schsql = "SELECT * FROM T_order" + _schcmd + " ORDER BY [O_id] DESC";
        //Response.Write(_schsql);
        SDSorder.SelectCommand = _schsql;
    }
}
