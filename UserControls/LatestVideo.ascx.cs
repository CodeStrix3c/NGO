using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class UserControls_LatestVideo : System.Web.UI.UserControl
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
       
            if (!IsPostBack)
            {
                litvideos.Text = this.Bind_Lit();
            }
    }

    private string Bind_Lit()
    {
       
            StringBuilder sb_HTML = new StringBuilder();
            DataSet ds = obj.GetTopOneVideo();

            if (ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr_SC in ds.Tables[0].Rows)
                {
                                sb_HTML.Append("<li class=\"item\" id=\"item_19\">");
					             sb_HTML.Append("<div class=\"item_content\">");
                               //  sb_HTML.Append("<div id=\"Div22\"></div>");
						         sb_HTML.Append("<div class=\"video_outer\">");
	                              sb_HTML.Append("<div class=\"video\">");
		                          sb_HTML.Append("<div class=\"video_inner\">");
                                  sb_HTML.Append("<iframe width=\"560\" height=\"315\" src=" + dr_SC["VideoName"].ToString() + " frameborder=\"0\" allowfullscreen></iframe>");
		                           sb_HTML.Append("</div>");
	                              sb_HTML.Append("</div>");
                                 sb_HTML.Append("</div>");	
                                 sb_HTML.Append("</div>  ");
				                 sb_HTML.Append("</li>");
                }

            }
            return sb_HTML.ToString();
       
    }
}