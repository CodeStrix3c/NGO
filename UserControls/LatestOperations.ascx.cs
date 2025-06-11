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

public partial class UserControls_LatestOperations : System.Web.UI.UserControl
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
        DataSet ds = obj.GetFourMenuCategory();

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ltrAds.Text += "<div class=\"colums_box no_bg colums_box_1\"> ";
                dr = ds.Tables[0].Rows[i];
                ltrAds.Text += " <div class=\"bluecap\">";
                ltrAds.Text += "<a class=\"colbox\" href='Category.aspx?Id=" + dr["Id"].ToString() + "&cn=" + dr["Title"].ToString()  + "' >";
                ltrAds.Text += "<h2><span>" + dr["Title"].ToString() + "</span></h2>";
                ltrAds.Text += " </a></div>";
                ltrAds.Text += " <p class=\"white\"> " + dr["Description"].ToString() + " </p>";
                ltrAds.Text += " </div>";
              
            }
        }
      
    }
}