using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Net.Mail;
using System.ComponentModel.Design;
using System.Text;
using System;
using System.Collections.Generic;
using System.IO;
using System.Data.Common;

public partial class Secure_Add_Jobs : System.Web.UI.Page
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
    }

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        string theSQL = "";
        theSQL += "INSERT INTO Jobs(Title,Description,CreatedDate) VALUES(";
        theSQL += "'" + txtTitle.Text.Replace("'", "''") + "',";
        theSQL += "'" + txtDescription.Text.Replace("'", "''") + "',";
        theSQL += "'" + obj.ReturnDate() + "'";
        theSQL += ")";
        MsgBox.Show(obj.InsertData(theSQL));
        txtTitle.Text = "";
        txtDescription.Text = "";
    }
}