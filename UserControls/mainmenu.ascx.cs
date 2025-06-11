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

public partial class UserControls_mainmenu : System.Web.UI.UserControl
{
    GenerateUrl obj_URL;
    StringBuilder arg;
    protected iLayer oCategoryManager;
    protected GenerateUrl getUrl = new GenerateUrl();

    protected void Page_Load(object sender, EventArgs e)
    {
        oCategoryManager = new iLayer();
        if (!IsPostBack)
        {
            ltrmenu.Text = this.Render_Links();
        }
    }

    #region "Private :: Helper methods here..."

    public string Render_Links()
    {

        StringBuilder sb_HTML = new StringBuilder();
        DataSet dt_CategoryManager = oCategoryManager.FE_Category_Get();

        int var_Counter = 0;

        if (dt_CategoryManager.Tables[0].Rows.Count > 0)
        {
          
            foreach (DataRow dr_SC in dt_CategoryManager.Tables[0].Rows)
            {
                sb_HTML.Append("<li id=\"iceMenu_203\" class=\"iceMenuLiLevel_1 mzr-drop parent\">");
                //sb_HTML.Append("<a href='" + this.Render_URLRewritableLink("CD", dr_SC["Title"].ToString(), dr_SC["ID"].ToString()) + "' title='" + dr_SC["Title"].ToString() + "' title='" + dr_SC["Title"].ToString() + "' class=\" iceMenuTitle\">");
                sb_HTML.Append("<a href='#' title='" + dr_SC["Title"].ToString() + "' title='" + dr_SC["Title"].ToString() + "' class=\" iceMenuTitle\">");
                sb_HTML.Append("<span class=\"icemega_title icemega_nosubtitle\">" + dr_SC["Title"].ToString() + "</span></a>");
               
                DataSet dt_SubCategoryManager = oCategoryManager.FE_DiscussionMain_Get(Convert.ToInt32(dr_SC["ID"].ToString()));

                if (dt_SubCategoryManager.Tables[0].Rows.Count > 0)
                {
                    sb_HTML.Append("<ul class=\"icesubMenu icemodules sub_level_1\" style=\"width:155px\">");
                    foreach (DataRow dr_SCS in dt_SubCategoryManager.Tables[0].Rows)
                    {
                        if (var_Counter != 0)
                        {
                            sb_HTML.Append("<li>");
                            sb_HTML.Append("<div style=\"float:left;width:155px\" class=\"iceCols\"><ul>");
                            sb_HTML.Append("<li id=\"iceMenu_171\" class=\"iceMenuLiLevel_2\"><a href='details.aspx?Id=" + dr_SCS["Id"].ToString() + "&cn=" + dr_SCS["Title"].ToString() + "&catName=" + dr_SC["Title"].ToString() + "&CId=" + dr_SC["ID"].ToString() + "' title='" + dr_SCS["Title"].ToString() + "' class=\" iceMenuTitle\"> ");
                            sb_HTML.Append("<span class=\"icemega_title icemega_nosubtitle\"> " + dr_SCS["Title"].ToString() + "</span>");
                            sb_HTML.Append("</a></li>");
                            sb_HTML.Append("</ul></div>");
                            sb_HTML.Append("</li>");
                        }
                        if (var_Counter == 0)
                        {
                          

                            sb_HTML.Append("<li>");
                            sb_HTML.Append("<div style=\"float:left;width:155px\" class=\"iceCols\"><ul>");
                            sb_HTML.Append("<li id=\"iceMenu_171\" class=\"iceMenuLiLevel_2\"><a href='Financials.aspx' title='Financials' class=\" iceMenuTitle\"> ");
                            sb_HTML.Append("<span class=\"icemega_title icemega_nosubtitle\">FINANCIALS</span>");
                            sb_HTML.Append("</a></li>");
                            sb_HTML.Append("</ul></div>");
                            sb_HTML.Append("</li>");

                            sb_HTML.Append("<li>");
                            sb_HTML.Append("<div style=\"float:left;width:155px\" class=\"iceCols\"><ul>");
                            sb_HTML.Append("<li id=\"iceMenu_171\" class=\"iceMenuLiLevel_2\"><a href='boardmembers.aspx' title='Board Members' class=\" iceMenuTitle\"> ");
                            sb_HTML.Append("<span class=\"icemega_title icemega_nosubtitle\">BOARD MEMBERS</span>");
                            sb_HTML.Append("</a></li>");
                            sb_HTML.Append("</ul></div>");
                            sb_HTML.Append("</li>");

                            sb_HTML.Append("<li>");
                            sb_HTML.Append("<div style=\"float:left;width:155px\" class=\"iceCols\"><ul>");
                            sb_HTML.Append("<li id=\"iceMenu_171\" class=\"iceMenuLiLevel_2\"><a href='details.aspx?Id=" + dr_SCS["Id"].ToString() + "&cn=" + dr_SCS["Title"].ToString() + "&catName=" + dr_SC["Title"].ToString() + "&CId=" + dr_SC["ID"].ToString() + "' title='" + dr_SCS["Title"].ToString() + "' class=\" iceMenuTitle\"> ");
                            sb_HTML.Append("<span class=\"icemega_title icemega_nosubtitle\"> " + dr_SCS["Title"].ToString() + "</span>");
                            sb_HTML.Append("</a></li>");
                            sb_HTML.Append("</ul></div>");
                            sb_HTML.Append("</li>");
                        }
                         var_Counter += 1;
                    }

                    sb_HTML.Append("</ul> ");
                }
                sb_HTML.Append("</li>");
            }
            // sb_HTML.Append(" </ul>");
        }
      
        return sb_HTML.ToString();
    }

    /// <summary>
    /// Method is used to render Rewritable URL
    /// </summary>
    /// <param name="varDirectoryName">Directory Name</param>
    /// <param name="varTitle">Title</param>
    /// <param name="varID">ID</param>
    /// <returns>String</returns>
    public string Render_URLRewritableLink(object varDirectoryName, object varTitle, object varID)
    {
        obj_URL = new GenerateUrl();

        return obj_URL.GenerateURL(varDirectoryName, varTitle, varID);
    }

    public string GetUrl(object PageName, object TitleName, object IdNumber)
    {
        string returnPxUrl = string.Empty;
        returnPxUrl = getUrl.GenerateURL(PageName, TitleName, IdNumber);

        return returnPxUrl;
    }

    public string GetUrl(object PageName, object Product_Title, object Product_Id, object Product_CategoryId, object Product_SubCatId)
    {
        string returnUrl = string.Empty;
        returnUrl = getUrl.GenerateURL(PageName, Product_Title, Product_Id, Product_CategoryId, Product_SubCatId);
        return returnUrl;

    }

    #endregion
}