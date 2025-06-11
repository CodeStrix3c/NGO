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

public partial class UserControls_OngoingProjects : System.Web.UI.UserControl
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
        DataSet ds = obj.GetTopSixProjects();

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];

                  ltrProjects.Text += " <article class=\"span3 item item_num0 item__module  \" id=\"item_83\">";
                  ltrProjects.Text += "              <div class=\"item_content\">";
	               ltrProjects.Text += "                 <figure class=\"item_img img-intro img-intro__none\"> ";
                   ltrProjects.Text += "                             <a href='project.aspx?Id=" + dr["Id"].ToString() + "&cn=" + dr["Title"].ToString() + "'>";
					ltrProjects.Text += "                                <span class=\"lazy_container\" style=\"width: 252px;\"><span class=\"lazy_preloader\" style=\"padding-top: 100%;\"></span><img src='Upload/" + dr["ImageUrl"].ToString() + "' class=\"lazy\" data-src='Upload/" + dr["ImageUrl"].ToString() + "' alt=\"\"></span>";
					ltrProjects.Text += "	                                <figcaption>view more..</figcaption>";
					ltrProjects.Text += "                                </a>";
			       ltrProjects.Text += "                         </figure>";
	               ltrProjects.Text += "                 <div class=\"itemInner\">";
				  ltrProjects.Text += "                              <h4 class=\"item_title item_title__\">";
                  ltrProjects.Text += "		                                <a href='project.aspx?Id=" + dr["Id"].ToString() + "&cn=" + dr["Title"].ToString() + "'>" + dr["Title"].ToString() + "</a>";
				ltrProjects.Text += "	                                </h4>";
		         // ltrProjects.Text += "                      <div id=\"Div48\"></div>";
                  // ltrProjects.Text += "                     <div class=\"item_introtext\">";
                  //ltrProjects.Text += "                          Natus error sit voluptatem accusantium ";
                  //ltrProjects.Text += "                      </div>";
	               ltrProjects.Text += "                 </div>";
                   ltrProjects.Text += "             </div>";
                    ltrProjects.Text += "              <div class=\"clearfix\"></div> ";
                    ltrProjects.Text += "        </article>";

             
            }
        }
    }
 
}