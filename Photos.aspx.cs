using System.Collections;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Net.Mail;
using System.ComponentModel.Design;
using System.Text;
using System;
using System.Collections.Generic;
using System.IO;
using System.Data.Common;

public partial class Photos : System.Web.UI.Page
{
    protected static int currentPage;
    protected static int lastPage;
    public int QueryString__AlbumID = 0, intCount = 0, QryStrId = 0;
    protected iLayer obj;
    protected ReeLogic Utility;
    protected Member myMember;
    public string strQryString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Utility = new ReeLogic();
        myMember = new Member();
        obj = new iLayer();
        if (Request.QueryString["Id"] == "" || Request.QueryString["Id"] == null || Request.QueryString["cn"] == "" || Request.QueryString["cn"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            QryStrId = Convert.ToInt32(Request.QueryString["Id"].ToString());
            strQryString = Request.QueryString["cn"].ToString();

            QueryString__AlbumID = QryStrId;
            lblSubCatName.Text = strQryString;
            if (!IsPostBack)
            {
                currentPage = 0;
                Bind_Grid();
            }

        }

    }

    protected void Bind_Grid()
    {
        DataSet ds = obj.GetPhotosByAlbumID(QueryString__AlbumID);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];

                  ltrimgs.Text += "<div class=\"jg_element_cat mix gallery-grid gallery-item\" data-date=\"20140903135719\" data-value=\"0\" data-name=\"Suspendisse\">";
                  ltrimgs.Text += " <div class=\"jg_imgalign_catimgs\">";
                   ltrimgs.Text += "    <span class=\"lazy lazy_container\" style=\"width: 347px;\">";
                  ltrimgs.Text += "     <span class=\"lazy lazy_preloader\" style=\"padding-top: 80.691642651297%;\"></span>";
                  ltrimgs.Text += "         <img src='Upload/" + dr["BytesPoster"].ToString() + "' data-src='Upload/" + dr["BytesPoster"].ToString() + "' class=\"lazy jg_photo\" width=\"347\" height=\"280\" alt=\"Suspendisse\" />";
                 ltrimgs.Text += "      </span>";
                ltrimgs.Text += "   <div class=\"jg_catelem_txt\">";
                 ltrimgs.Text += "    <ul>";
                  ltrimgs.Text += "     <li class=\"gallery_desc\">";
                  ltrimgs.Text += "        <p>" + dr["Caption"].ToString() + "</p>";
                  ltrimgs.Text += "     </li>";
                 ltrimgs.Text += "      <li class=\"jg_links\">";
                 ltrimgs.Text += " <a rel=\"{handler: 'iframe', size: {x: 700, y: 500}}\" class=\"modal acymailing_togglemodule\" id=\"acymailing_togglemodule_formAcymailing80611\" href='Upload/" + dr["BytesPoster"].ToString() + "'><i class=\"fa fa-search-plus\"></i></a>";
                // ltrimgs.Text += "       <a class=\"fancybox-thumb\" data-title=\"Suspendisse\" href='Upload/" + dr["BytesPoster"].ToString() + "' data-fancybox=\"fancybox\" data-fancybox-group=\"joomgallery\" data-fancybox-type=\"image\"><i class=\"fa fa-search-plus\"></i><span class=\"lazy lazy_container\" style=\"width: 347px;\"><span class=\"lazy lazy_preloader\" style=\"padding-top: 80.691642651297%;\"></span><img src='Upload/" + dr["BytesPoster"].ToString() + "' data-src='Upload/" + dr["BytesPoster"].ToString() + "' class=\"lazy jg_photo\" width=\"347\" height=\"280\" alt=\"Suspendisse\" /></span></a>";
                  ltrimgs.Text += "     </li>";
                  ltrimgs.Text += "   </ul>";
                  ltrimgs.Text += " </div>";
                 ltrimgs.Text += "  </div>";
                ltrimgs.Text += " </div>";

                //ltrimgs.Text += "<div class=\"camera-item\" data-src='Upload/" + dr["ImageUrl"].ToString() + "'>";
                //ltrAds.Text += "    <div class=\"camera_caption fadeIn\">";
                //ltrAds.Text += "    <h4 class=\"slide-title\">" + dr["Title"].ToString() + "</h4>";
                //ltrAds.Text += "	<p>" + dr["Intro"].ToString() + "</p>";
                //ltrAds.Text += "<a class=\"readmore\" href='banner.aspx?id=" + dr["Id"].ToString() + "&cn=" + dr["Title"].ToString() + "' target=\"_self\"><span>Click here</span></a>";
                //ltrAds.Text += "    </div>";
                //ltrAds.Text += " </div>";
            }
        }
    }

  
}