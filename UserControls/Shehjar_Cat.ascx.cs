using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class UserControls_Shehjar_Cat : System.Web.UI.UserControl
{
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
        DataSet ds = obj.GetShehjarCategory();

        ltrShehjarCat.Text += " <dl>";
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                 dr = ds.Tables[0].Rows[i];

                  ltrShehjarCat.Text += "<article class=\"span3 item item_num0 item__module  \" id=\"item_91\">";
                 ltrShehjarCat.Text += "    <div class=\"item_content\">";
	             ltrShehjarCat.Text += "       <div class=\"itemInner\">";
				 ltrShehjarCat.Text += "          <h4 class=\"item_title item_title__center icons\">";
                 ltrShehjarCat.Text += "              <a href='shehjar.aspx?Id=" + dr["Id"].ToString() + "&cn=" + dr["Title"].ToString() + "'>";
                 ltrShehjarCat.Text += "          <img width='252px' height='200px' src='Upload/" + dr["ImageUrl"].ToString() + "' data-src='Upload/" + dr["ImageUrl"].ToString() + "' alt=\"\">";
                 ltrShehjarCat.Text += "		     " + dr["Title"].ToString() + " </a>";
				ltrShehjarCat.Text += "	        </h4>";
		         ltrShehjarCat.Text += "           <div id=\"Div32\"></div>";
		         ltrShehjarCat.Text += "           <div id=\"Div33\"></div>";
		          ltrShehjarCat.Text += "          <div class=\"item_introtext\">";
                  ltrShehjarCat.Text += "              <p>" + dr["Intro"].ToString() + "</p>";
		          ltrShehjarCat.Text += "          </div>";
	              ltrShehjarCat.Text += "      </div>";
                  ltrShehjarCat.Text +="    <a class=\"btn btn-info readmore\" href='shehjar.aspx?Id=" + dr["Id"].ToString() + "&cn=" + dr["Title"].ToString() + "'><span>Read more</span></a>";
                 ltrShehjarCat.Text += "   </div>";
                 ltrShehjarCat.Text += "   <div class=\"clearfix\"></div>  ";
                 ltrShehjarCat.Text += "   </article>";

               
                //ltrShehjarCat.Text += "<dt>" + dr["Title"].ToString() + "</dt>";
                //ltrShehjarCat.Text += "<dd>";
                //ltrShehjarCat.Text += "<img src='Upload/" + dr["ImageUrl"].ToString() + "' Title='" + dr["Title"].ToString() + "' style='float:left; padding-right:5px'/>";
                //ltrShehjarCat.Text += "" + dr["Intro"].ToString() + "";
                //ltrShehjarCat.Text += "<br/>";
                //ltrShehjarCat.Text += "<a href='ShehjarDescription.aspx?Id=" + dr["ID"].ToString() + "'>";
                //ltrShehjarCat.Text += "<img src='images/read_more_icon.jpg' style='border:0px'/>";
                //ltrShehjarCat.Text += "</a>";
                //ltrShehjarCat.Text += "</dd>";
            }
        }
        ltrShehjarCat.Text += "</dl>";
    }
}