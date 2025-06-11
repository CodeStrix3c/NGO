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

public partial class UserControls_Banner : System.Web.UI.UserControl
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
        DataSet ds = obj.GetTopTenBanners();
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];

                ltrAds.Text += "<div class=\"camera-item\" data-src='Upload/" + dr["ImageUrl"].ToString() + "'>";
			    ltrAds.Text += "    <div class=\"camera_caption fadeIn\">";
                ltrAds.Text += "    <h4 class=\"slide-title\">" + dr["Title"].ToString() + "</h4>";
                ltrAds.Text += "	<p>" + dr["Intro"].ToString() + "</p>";
                ltrAds.Text += "<a class=\"readmore\" href='banner.aspx?id=" + dr["Id"].ToString() + "&cn=" + dr["Title"].ToString() + "' target=\"_self\"><span>Click here</span></a>";
		        ltrAds.Text += "    </div>";
                ltrAds.Text += " </div>";
            }
        }
    }
}