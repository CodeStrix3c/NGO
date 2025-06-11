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

public partial class category : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    GenerateUrl obj_URL;
    protected GenerateUrl getUrl = new GenerateUrl();
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (Request.QueryString["CatId"] == "" || Request.QueryString["CatId"] == null || Request.QueryString["cn"] == "" || Request.QueryString["cn"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            Page.Header.Title = Request.QueryString["cn"];
            lblCName.Text = Request.QueryString["cn"];
            if (!IsPostBack)
            {
                Bind_Grid();
            }
        }
    }

    protected void Bind_Grid()
    {

        //DataSet dsimg = obj.GetMenuSubCategoryByID(Convert.ToInt32(Request.QueryString["Id"]));
        //if (dsimg.Tables[0].Rows.Count > 0)
        //{
        //    DataRow dr;
        //    int i = 0;
        //    for (i = 0; i < dsimg.Tables[0].Rows.Count; i++)
        //    {
        //        dr = dsimg.Tables[0].Rows[i];
        //        ltrImage.Text += "<img width=\"100%\" src='Upload/" + dr["ImageUrl"].ToString() + "' class=\"lazy\" data-src='Upload/" + dr["ImageUrl"].ToString() + "' alt=\"\">";
        //    }
        //}


        DataSet ds = obj.GetMenuSubCategoryByCatID(Convert.ToInt32(Request.QueryString["CatId"]));

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr1;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr1 = ds.Tables[0].Rows[i];

                ltrCategory.Text += "  <div class=\"jg_subcatelem_cat\">";
                ltrCategory.Text += "     <div class=\"jg_imgalign_catsubs\">";
                ltrCategory.Text += "       <div class=\"jg_subcatelem_photo\">";
                ltrCategory.Text += "         <a href='details.aspx?Id=" + dr1["Id"].ToString() + "&cn=" + dr1["Title"].ToString() + "&catName=" + Request.QueryString["cn"] + "&CId=" + Convert.ToInt32(Request.QueryString["CatId"]) + "'>";
                ltrCategory.Text += "           <span class=\"lazy lazy_container lazyloaded\" style=\"width: 347px; height:250px\"><span class=\"lazy lazy_preloader\" style=\"padding-top: 80.691642651297%;\"></span><img style=\"width: 347px; height:250px\" src='Upload/" + dr1["ImageUrlLarge"].ToString() + "' hspace=\"4\" vspace=\"0\" class=\"lazy jg_photo\" alt=\"\" style=\"display: block;\"></span>";
                ltrCategory.Text += "         </a>";
                ltrCategory.Text += "       </div>";
                ltrCategory.Text += "      <div class=\"jg_subcatelem_txt\">";
                ltrCategory.Text += "        <a title='" + dr1["Title"].ToString() + "' class=\"jg_subcatelem_txt__link\" href='details.aspx?Id=" + dr1["Id"].ToString() + "&cn=" + dr1["Title"].ToString() + "&catName=" + Request.QueryString["cn"] + "&CId=" + Convert.ToInt32(Request.QueryString["CatId"]) + "'></a>";
                ltrCategory.Text += "        <ul>";
                ltrCategory.Text += "          <li class=\"lastItem firstItem\">";
                ltrCategory.Text += "             " + dr1["Title"].ToString() + "        </li>";
                ltrCategory.Text += "                    </ul>";
                ltrCategory.Text += "      </div>";
                ltrCategory.Text += "     </div>";
                ltrCategory.Text += "    </div>";

            }
        }

    }

    public string Render_URLRewritableLink(object varDirectoryName, object varTitle, object varID)
    {
        obj_URL = new GenerateUrl();

        return obj_URL.GenerateURL(varDirectoryName, varTitle, varID);
    }

}