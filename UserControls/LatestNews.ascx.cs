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

public partial class UserControls_LatestNews : System.Web.UI.UserControl
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            ltrNews.Text = this.Bind_Grid();
        }
    }
    private string Bind_Grid()
    {
        StringBuilder sb_HTML = new StringBuilder();
        DataSet ds = obj.GetTopTenNews();

        if (ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr_SC in ds.Tables[0].Rows)
            {

                string strInvoice_date = Convert.ToDateTime(dr_SC["CreatedDate"]).ToString("d <br> MMMM <br> yyyy");

            sb_HTML.Append("<div class=\"row-fluid\">");
            sb_HTML.Append(" <article class=\"span6 item item_num0 item__module  \" id=\"item_99\">");
            sb_HTML.Append("  <div class=\"item_content\">");
            sb_HTML.Append("<div style='float:left; width:20%; text-align:center; background-color:#22ADD6'>");
            sb_HTML.Append("<h4><span style='color:black'>" + strInvoice_date + "</span></h4>");
            sb_HTML.Append("</div>");
	       // sb_HTML.Append("     <figure class=\"item_img img-intro img-intro__left\"> ");
           // sb_HTML.Append("" + dr_SC["CreatedDate"].ToString() + "");
            //sb_HTML.Append(" 	     <a href='news.aspx?Id=" + dr_SC["Id"].ToString() + "&cn=" + dr_SC["Title"].ToString() + "'>");
            //sb_HTML.Append(" 		   <span class=\"lazy_container\" style=\"width: 101px;\"><span class=\"lazy_preloader\" style=\"padding-top: 100%;\"></span>");
            //sb_HTML.Append("             <img src='Upload/" + dr_SC["ImageUrl"].ToString() + "' class=\"lazy\" data-src='Upload/" + dr_SC["ImageUrl"].ToString() + "' alt=\"\">");
            //sb_HTML.Append("            </span>");
            //sb_HTML.Append(" 		 </a>");
		   // sb_HTML.Append("     </figure>");
	        sb_HTML.Append("    <div class=\"itemInner\">");
			sb_HTML.Append("             <h4 class=\"item_title item_title__type\">");
            sb_HTML.Append(" 		      <a href='news.aspx?Id=" + dr_SC["Id"].ToString() + "&cn=" + dr_SC["Title"].ToString() + "'>" + dr_SC["Title"].ToString() + "</a>");
			sb_HTML.Append(" 	       </h4>");
		    sb_HTML.Append("       <div class=\"item_introtext\">");
            sb_HTML.Append("" + dr_SC["Intro"].ToString() + "");
		    sb_HTML.Append("       </div>");
            sb_HTML.Append("<a class=\"btn btn-info readmore\" href='news.aspx?Id=" + dr_SC["Id"].ToString() + "&cn=" + dr_SC["Title"].ToString() + "'><span>Read more</span></a>");
	        sb_HTML.Append("   </div>");
            sb_HTML.Append("  </div>");
            sb_HTML.Append("   <div class=\"clearfix\"></div>  </article>");
            sb_HTML.Append("  </div>");

            }
        }

        return sb_HTML.ToString();

    }
}