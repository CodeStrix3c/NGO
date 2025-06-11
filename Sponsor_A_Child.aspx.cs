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

public partial class Sponsor_A_Child : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
      
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            string theSQL = "";
            theSQL += "INSERT INTO SponsorChild(Name,MobileNo,Email,Subject,Organization,Message,CreatedDate) VALUES(";
            theSQL += "'" + txtCName.Text.Replace("'", "''") + "',";
            theSQL += "'" + txtMContactNo.Text.Replace("'", "''") + "',";
            theSQL += "'" + txtEmailID.Text.Replace("'", "''") + "',";
            theSQL += "'" + txtSubject.Text.Replace("'", "''") + "',";
            theSQL += "'" + txtOrganization.Text.Replace("'", "''") + "',";
            theSQL += "'" + txtDescription.Text.Replace("'", "''") + "',";
            theSQL += "'" + obj.ReturnDate() + "'";
            theSQL += ")";
            MsgBox.Show(obj.InsertData(theSQL));
            resentfields();
        }
        catch { }
    }

    public void resentfields()
    {
        txtEmailID.Text = string.Empty;
        txtDescription.Text = string.Empty;
        txtMContactNo.Text = string.Empty;
        txtCName.Text = string.Empty;
        txtSubject.Text = string.Empty;
        txtOrganization.Text = string.Empty;
    }
 
}