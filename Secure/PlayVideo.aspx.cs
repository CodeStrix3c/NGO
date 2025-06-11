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

public partial class FazilKashmir_Ad_PlayVideo : System.Web.UI.Page
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
                Bind_Lit();
            }
        }
    }
    protected void Bind_Lit()
    {
        DataSet ds = obj.GetVideoForPlayByID(Convert.ToInt32(Request.QueryString["ID"]));
        lit.Text = "<iframe title='YouTube video player' width='480' height='350' src=" + ds.Tables[0].Rows[0]["VideoName"].ToString() + " frameborder='0' allowfullscreen></iframe>";
        
    }
}
