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

public partial class Control_F_rotater : System.Web.UI.UserControl
{
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        Utility = new ReeLogic();
        if (!IsPostBack)
        {
            Bind_Grid();
        }
    }
    //protected void Bind_Grid2()
    //{
    //    DataSet ds = PhotoManage.GetAlbums2();
    //    if(ds.Tables[0].Rows.Count>0)
    //    {
    //        DataRow dr;
    //        int i=0;
    //        for(i=0;i<ds.Tables[0].Rows.Count;i++)
    //        {
    //            dr = ds.Tables[0].Rows[i];
    //            ltrAds.Text +="<div>";
    //            ltrAds.Text += "<img src='Control/ShowImage.aspx?AlbumID=" + dr["AlbumID"].ToString() + "&Size=M' alt=''/>";
    //            //ltrAds.Text +="<div class='featured_content'>";
    //            //ltrAds.Text +="<h4>"+dr["Caption"].ToString()+"</h4>";
    //            //ltrAds.Text +="</div>";
    //            ltrAds.Text += "</div>";
    //        }
        
    //    }

    //}
    protected void Bind_Grid()
    {
        DataSet ds = Utility.ReturnFields("SELECT * FROM Ads WHERE IsActive=True ORDER BY ID DESC");
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                ltrAds.Text += "<div>";
                ltrAds.Text += "<img src='Upload/" + dr["FileName"].ToString() + "' alt=''/>";
                ltrAds.Text += "<div class='featured_content'>";
                ltrAds.Text += "<h4>" + dr["Caption"].ToString() + "</h4>";
                ltrAds.Text += "</div>";
                ltrAds.Text += "</div>";
            }

        }

    }
}
