using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

/// <summary>
/// MyClasses 的摘要说明
/// </summary>
namespace MyClasses
{   /// <summary>
/// 自定义数据类连接
/// </summary>
    public class SuperConn
    {   public OleDbConnection cnn;
        private OleDbCommand cmd;
        private OleDbDataReader datar;
        public SuperConn(string _fileName)
        {
            string _path = "/App_data/" + _fileName;
            string _strconn = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + HttpContext.Current.Server.MapPath(_path);
            cnn = new OleDbConnection(_strconn);
        }
        public void Open()
        {
            cnn.Open();
        }
        public void Close()
        {
            cnn.Close();
        }
        public OleDbDataReader GetDataReader(string _sql)
        {
            cmd = new OleDbCommand(_sql, cnn);
            datar = cmd.ExecuteReader();
            return datar;
        }

    }
}