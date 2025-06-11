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


public partial class Secure_Add_TermsAndConditions : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        string theSQL = "";
        theSQL += "INSERT INTO Terms(Title,Description,CreatedDate) VALUES(";
        theSQL += "'" + txtTitle.Text.Replace("'", "''") + "',";
        //theSQL += "'" + txtIntro.Text.Replace("'", "''") + "',";
        theSQL += "'" + txtDescription.Text.Replace("'", "''") + "',";
        theSQL += "'" + obj.ReturnDate() + "'";
        theSQL += ")";
        MsgBox.Show(obj.InsertData(theSQL));
        txtTitle.Text = "";
       // txtIntro.Text = "";
        txtDescription.Text = "";
    }
}