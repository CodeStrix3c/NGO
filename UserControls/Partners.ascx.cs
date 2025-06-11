using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class UserControls_Partners : System.Web.UI.UserControl
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            Bind_Grid();
        }
    }
    protected void Bind_Grid()
    {
        DataSet ds = obj.Gettop5Partners();
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];

                 ltrAds.Text += "<li class=\"item-274\" style=\"padding-right:5px\" > ";
                 ltrAds.Text += "<a href='" + dr["Url"].ToString() + "' target='_blank'>";
                 ltrAds.Text += "  <img src='Upload/" + dr["ImageUrl"].ToString() + "' class=\"lazy\" data-src='Upload/" + dr["ImageUrl"].ToString() + "' alt=\"No Logo\" /></a></li>";

        
            }
        }
    }
}