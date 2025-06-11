using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class Secure_Add_HomeDetails : System.Web.UI.Page
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        string theSQL = "";
            theSQL = "INSERT INTO Home(Title,Intro,Description,CreatedDate,ModifiedDate) VALUES(";
            theSQL += "'" + txtTitle.Text.Replace("'", "''") + "',";
            theSQL += "'" + txtIntro.Text.Replace("'", "''") + "',";
            theSQL += "'" + txtDescription.Text.Replace("'", "''") + "',";
            theSQL += "'" + obj.ReturnDate() + "',";
            theSQL += "'" + obj.ReturnDate() + "'";
            theSQL += ")";
            MsgBox.Show(obj.InsertAboutUs(theSQL));
            txtTitle.Text = "";
            txtIntro.Text = "";
            txtDescription.Text = "";
       
    }
}