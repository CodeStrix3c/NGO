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


public partial class contact : System.Web.UI.Page
{

    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            Bind_Grid();
          //  if (GeneratedText == null)
           //     TryNew();
        }
    }
    private void Bind_Grid()
    {
        try
        {
            DataSet ds = obj.GetContactUs();
            Grid.DataSource = ds;
            Grid.DataBind();
        }
        catch { }
    }

    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string Index = e.NewPageIndex.ToString();
        Grid.PageIndex = Convert.ToInt32(Index);
        Bind_Grid();
    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        string nName = Request.Form["jform[contact_name]"];
        string Mobile = Request.Form["jform[contact_mobile]"];
        string email = Request.Form["jform[contact_email]"];
        string message = Request.Form["jform[contact_message]"];

        string theSQL = "";
        theSQL += "INSERT INTO ContactDeatils(Name,MobileNo,Email,Message,CreatedDate) VALUES(";
        theSQL += "'" + nName.Replace("'", "''") + "',";
        theSQL += "'" + Mobile.Replace("'", "''") + "',";
        theSQL += "'" + email.Replace("'", "''") + "',";
        theSQL += "'" + message.Replace("'", "''") + "',";
        theSQL += "'" + obj.ReturnDate() + "'";
        theSQL += ")";
        MsgBox.Show(obj.InsertData(theSQL));
    }
}