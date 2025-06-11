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


public partial class Secure_RegistrationDetails : System.Web.UI.Page
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (Request.QueryString["Id"] == "" || Request.QueryString["Id"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                Bind_Grid();
            }
        }
    }
    private void Bind_Grid()
    {

        DataSet ds = obj.GetOnlineRegistrationById(Convert.ToInt32(Request.QueryString["Id"]));
        Grid.DataSource = ds;
        Grid.DataBind();

    }
}