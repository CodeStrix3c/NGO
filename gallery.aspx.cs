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

public partial class gallery : System.Web.UI.Page
{
    protected static int currentPage;
    protected static int lastPage;
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
        DataSet ds = obj.GetAlbums();
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];

                ltrimgs.Text += " <div class=\"jg_subcatelem_cat\">";
                ltrimgs.Text += "          <div class=\"jg_imgalign_catsubs\">";
                ltrimgs.Text += "            <div class=\"jg_subcatelem_photo\">";
                ltrimgs.Text += "             <a href='Photos.aspx?id=" + dr["AlbumID"].ToString() + "&cn=" + dr["Caption"].ToString() + "'>";
                ltrimgs.Text += "               <span class=\"lazy lazy_container lazyloaded\" style=\"width: 347px;\"><span class=\"lazy lazy_preloader\" style=\"padding-top: 80.691642651297%;\"></span>";
                ltrimgs.Text += "                   <img src='Upload/" + dr["BytesThumb"].ToString() + "' hspace=\"4\" vspace=\"0\" class=\"lazy jg_photo\" alt=\"First Category\" style=\"display: block;\">";
                ltrimgs.Text += "               </span>";
                ltrimgs.Text += "                </a>";
                ltrimgs.Text += "           </div>";
                ltrimgs.Text += "        <div class=\"jg_subcatelem_txt\">";
                ltrimgs.Text += "         <a class=\"jg_subcatelem_txt__link\" href='Photos.aspx?id=" + dr["AlbumID"].ToString() + "&cn=" + dr["Caption"].ToString() + "'></a>";
                ltrimgs.Text += "       <ul>";
                ltrimgs.Text += "       <li class=\"lastItem firstItem\">";
                ltrimgs.Text += "" + dr["Caption"].ToString() + "<br>";
                ltrimgs.Text += "" + dr["NumberOfPhotos"].ToString() + " Photos";
                ltrimgs.Text += "     </li>";
                ltrimgs.Text += "   </ul>";
                ltrimgs.Text += "      </div>";
                ltrimgs.Text += "      </div>";
                ltrimgs.Text += "     </div>";


                //ltrimgs.Text += "<div class=\"camera-item\" data-src='Upload/" + dr["BytesThumb"].ToString() + "'>";
                //ltrAds.Text += "    <div class=\"camera_caption fadeIn\">";
                //ltrAds.Text += "    <h4 class=\"slide-title\">" + dr["Title"].ToString() + "</h4>";
                //ltrAds.Text += "	<p>" + dr["Caption"].ToString() + "</p>";
                //ltrAds.Text += "<a class=\"readmore\" href='Photos.aspx?id=" + dr["AlbumID"].ToString() + "&cn=" + dr["Caption"].ToString() + "' target=\"_self\"><span>Click here</span></a>";
                //ltrAds.Text += "    </div>";
                //ltrAds.Text += " </div>";
            }
        }
    }
}