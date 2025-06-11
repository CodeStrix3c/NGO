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

public partial class details : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    GenerateUrl obj_URL;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (Request.QueryString["Id"] == "" || Request.QueryString["Id"] == null || Request.QueryString["cn"] == "" || Request.QueryString["cn"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            Page.Header.Title = Request.QueryString["cn"];
            lblSubName.Text = Request.QueryString["cn"];
            lblCName.Text = Request.QueryString["catName"];
            if (!IsPostBack)
            {
                Bind_Grid();
                Bind_CatSubLinks();
            }
        }
    }

    protected void Bind_CatSubLinks()
    {
        DataSet ds = obj.GetMenuSubCategoryByCatID(Convert.ToInt32(Request.QueryString["CId"]));
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];

                ltrLinks.Text += "<li class=\"item-267 firstItem\">";
                ltrLinks.Text += "<a href='details.aspx?Id=" + dr["Id"].ToString() + "&cn=" + dr["Title"].ToString() + "&catName=" + Request.QueryString["catName"] + "&CId=" + Convert.ToInt32(Request.QueryString["CId"]) + "' target=\"_self\">" + dr["Title"].ToString() + "</a>";
                ltrLinks.Text += "</li>";
            }
        }
    }

    protected void Bind_Grid()
    {

        DataSet dsimg = obj.GetMenuSubCategoryByID(Convert.ToInt32(Request.QueryString["Id"]));
        if (dsimg.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < dsimg.Tables[0].Rows.Count; i++)
            {
                dr = dsimg.Tables[0].Rows[i];
                ltrImage.Text += "<img width=\"100%\" src='Upload/" + dr["ImageUrl"].ToString() + "' class=\"lazy\" data-src='Upload/" + dr["ImageUrl"].ToString() + "' alt=\"\">";
            }
        }


        DataSet ds = obj.GetMenuDetailsByCatSubID(Convert.ToInt32(Request.QueryString["Id"]));

        int var_Counter = 0;
        int var_count = 0;

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr1;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr1 = ds.Tables[0].Rows[i];

                if (var_Counter == 0)
                {
                    ltrDetails.Text += " <div class=\"row-fluid\">";
                    ltrDetails.Text += "      <article class=\"span8 item item_num0 item__module  \" id=\"item_70\">";
                    ltrDetails.Text += "  <div class=\"item_content\">";
                    //if (!string.IsNullOrEmpty("ImageUrl"))
                    //{
                    //    ltrDetails.Text += "<a href='#'>";
                    //    ltrDetails.Text += "<img src='Upload/" + dr1["ImageUrl"].ToString() + "' class=\"lazy\" data-src='Upload/" + dr1["ImageUrl"].ToString() + "' alt=\"\">";
                    //    ltrDetails.Text += "</a>";
                    //}
                    ltrDetails.Text += "<div class=\"itemInner\">";
                    ltrDetails.Text += "<br/><h4 class=\"item_title item_title__\">";
                    ltrDetails.Text += "<span class=\"item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first\">" + dr1["Title"].ToString() + "</span></h4>";
                    ltrDetails.Text += "            <div id=\"fb-root\"></div>";
                    ltrDetails.Text += "            <div class=\"item_introtext\">";
                    ltrDetails.Text += "                <p>" + dr1["Description"].ToString() + "</p>";
                    ltrDetails.Text += "             </div>";
                    ltrDetails.Text += "         </div>";
                    ltrDetails.Text += "      </div>";

                    ltrDetails.Text += "      <div class=\"clearfix\"></div>  </article>";
                    ltrDetails.Text += "      </div>";

                    if (!string.IsNullOrEmpty("ImageUrlLarge"))
                    {
                        ltrDetails.Text += "<img src='Upload/" + dr1["ImageUrlLarge"].ToString() + "' class=\"lazy\" data-src='Upload/" + dr1["ImageUrlLarge"].ToString() + "' alt=\"\">";
                    }

                 
                       


                }

                if (var_Counter != 0)
                {
                    if (var_Counter == 1)
                    {
                        ltrCat.Text += "<header><h3 class=\"moduleTitle\">";
                        ltrCat.Text += "<span style='float:left; padding-left:40px' class=\"item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first\">";
                        ltrCat.Text += "KEY PROJECTS";
                        ltrCat.Text += "</span> ";
                        ltrCat.Text += "</h3>";
                        ltrCat.Text += "</header>";
                    }

                        ltrCat.Text += "<article class=\"span3 item item_num0 item__module  \" id=\"item_91\">";
                        ltrCat.Text += "<ul class=\"nav menu footer\">";
                        ltrCat.Text += " <li><h3 class=\"moduleTitle\"><a style='float:left; width:60%' href='description.aspx?Id=" + dr1["Id"].ToString() + "&cn=" + dr1["Title"].ToString() + "' class=\"button\">" + dr1["Title"].ToString() + "</a></h3></li>";
                        ltrCat.Text += " </ul>";
                        ltrCat.Text += "</article>";
                }
                var_Counter += 1;

            }
        }

    }


    public string Render_URLRewritableLink(object varDirectoryName, object varTitle, object varID)
    {
        obj_URL = new GenerateUrl();

        return obj_URL.GenerateURL(varDirectoryName, varTitle, varID);
    }
}