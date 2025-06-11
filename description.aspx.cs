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

public partial class description : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                Bind_Grid();
            }
        }
    }

    protected void Bind_Grid()
    {

        DataSet ds = obj.GetMenuDetailsByID(Convert.ToInt32(Request.QueryString["Id"]));

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr1;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr1 = ds.Tables[0].Rows[i];
              
                    ltrDetails.Text += " <div class=\"row-fluid\">";
                    ltrDetails.Text += "      <article class=\"span8 item item_num0 item__module  \" id=\"item_70\">";
                    ltrDetails.Text += "  <div class=\"item_content\">";
                    if (!string.IsNullOrEmpty("ImageUrl"))
                    {
                        ltrDetails.Text += "<a href='#'>";
                        ltrDetails.Text += "<img style='float:left; padding-right:10px' src='Upload/" + dr1["ImageUrl"].ToString() + "' class=\"lazy\" data-src='Upload/" + dr1["ImageUrl"].ToString() + "' alt=\"\">";
                        ltrDetails.Text += "</a>";
                    }
                    ltrDetails.Text += "<div class=\"itemInner\">";
                    //ltrDetails.Text += "<br/><h4 class=\"item_title item_title__\">";
                   // ltrDetails.Text += "<span class=\"item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first\">" + dr1["Title"].ToString() + "</span></h4>";
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
                        ltrImage.Text += "<img width=\"100%\" src='Upload/" + dr1["ImageUrlLarge"].ToString() + "' class=\"lazy\" data-src='Upload/" + dr1["ImageUrlLarge"].ToString() + "' alt=\"\">";
                    }
            }
        }

    }
}