using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;

public partial class UserControls_HomeDetails : System.Web.UI.UserControl
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {

            ltrHomeDetails.Text = this.Render_Links();
          
        }
    }
    #region "Private :: Helper methods here..."

    public string Render_Links()
    {

        StringBuilder sb_HTML = new StringBuilder();
        DataSet dt_CategoryManager = obj.GetHomeData_FE();

        if (dt_CategoryManager.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr_SC in dt_CategoryManager.Tables[0].Rows)
            {

              sb_HTML.Append("<article class=\"span4 item item_num0 item__module  \" id=\"item_102\">");
              sb_HTML.Append("<div class=\"item_content\">");
	          sb_HTML.Append("<div class=\"itemInner\">");
			  sb_HTML.Append("<h4 class=\"item_title item_title__center\">");
              sb_HTML.Append("<span class=\"item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first\">'" + dr_SC["Title"].ToString() + "'</span>");		
			  sb_HTML.Append("</h4>");
		      sb_HTML.Append("<div id=\"Div10\"></div>");
		      sb_HTML.Append("<div id=\"Div11\"></div>");
		      sb_HTML.Append("<div class=\"item_introtext\">");
              sb_HTML.Append("<p>'" + dr_SC["Intro"].ToString() + "'</p>");
		      sb_HTML.Append("</div>");
              sb_HTML.Append("<a class=\"btn btn-info readmore\" href='HDeails.aspx?Id=" + dr_SC["Id"].ToString() + "&cn=" + dr_SC["Title"].ToString() + "' ><span>Read more</span></a>");
	          sb_HTML.Append("</div>");
              sb_HTML.Append("</div>");
              sb_HTML.Append("</article>");

            }
        }

        return sb_HTML.ToString();
    }

  
    #endregion
}