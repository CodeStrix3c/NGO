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

public partial class boardmembers : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    GenerateUrl obj_URL;
    protected GenerateUrl getUrl = new GenerateUrl();
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
            if (!IsPostBack)
            {
                Bind_Grid();
            }
    }

    protected void Bind_Grid()
    {
        DataSet ds = obj.GetBoardMembers();
        ltrCategory.Text += " <dl>";
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                dr = ds.Tables[0].Rows[i];
                ltrCategory.Text += "<article class=\"span3 item item_num0 item__module  \" id=\"item_91\">";
                ltrCategory.Text += "    <div class=\"item_content\">";
                ltrCategory.Text += "       <div class=\"itemInner\">";
                ltrCategory.Text += "          <h4 class=\"item_title item_title__center icons\">";
                ltrCategory.Text += "              <a href='member_bio.aspx?Id=" + dr["Id"].ToString() + "&cn=" + dr["MName"].ToString() + "'>";
                ltrCategory.Text += "          <img height='230px' src='Upload/" + dr["ImageUrl"].ToString() + "' data-src='Upload/" + dr["ImageUrl"].ToString() + "' alt=\"\"><br>";
                ltrCategory.Text += "		     " + dr["MName"].ToString() + " </a>";
                ltrCategory.Text += "	        </h4>";
                ltrCategory.Text += "           <div id=\"Div32\"></div>";
                ltrCategory.Text += "           <div id=\"Div33\"></div>";
                ltrCategory.Text += "          <div class=\"item_introtext\">";
                ltrCategory.Text += "              <p><b>" + dr["Position"].ToString() + "</b></p>";
                ltrCategory.Text += "          </div>";
                ltrCategory.Text += "      </div>";
                ltrCategory.Text += "<a class=\"btn btn-info readmore\" href='member_bio.aspx?Id=" + dr["Id"].ToString() + "&cn=" + dr["MName"].ToString() + "'><span>Read more</span></a>";
                ltrCategory.Text += "   </div>";
                ltrCategory.Text += "   <div class=\"clearfix\"></div>  ";
                ltrCategory.Text += "   </article>";
               
            }
        }
        ltrCategory.Text += "</dl>";

    }

 
}