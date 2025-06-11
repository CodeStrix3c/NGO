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


public partial class Secure_View_Acep_Registrationforms : System.Web.UI.Page
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (Request.QueryString["ID"] == "" || Request.QueryString["ID"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                obj.NewRegis_UnPublish(Convert.ToInt32(Request.QueryString["ID"]));
                Bind_Grid();
            }
        }
    }
    protected void Bind_Grid()
    {
        try
        {
            DataSet ds = obj.GetNewRegistrationByID(Convert.ToInt32(Request.QueryString["ID"]));
            Grid.DataSource = ds;
            Grid.DataBind();
        }
        catch { }

    }
    public string FileURL(object varfileUrl)
    {
        return "../Upload/" + varfileUrl.ToString();
    }
}