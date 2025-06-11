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


public partial class UserControls_LatestEvents : System.Web.UI.UserControl
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
    private void Bind_Grid()
    {

        DataSet ds = obj.GetTopTenEvents();
        if (ds.Tables[0].Rows.Count > 0)
        {
           // lblTitle.Text = " <h3 class=\"moduleTitle color\"> <span class=\"item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first\">Events </span>  </h3>";
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];

                 //  ltrEvents.Text += " <div class=\"item_content\">";
                 //ltrEvents.Text += "       <figure class=\"item_img img-intro img-intro__left\"> ";
                 //   ltrEvents.Text += "                <a href=\"/joomla_52178/index.php/give/36-giving-catalog/79-homes-facilities\">";
                 //    ltrEvents.Text += "                   <span class=\"lazy_container lazyloaded\" style="width: 252px;"><span class="lazy_preloader" style="padding-top: 86.507936507937%;"></span><img src="https://livedemo00.template-help.com/joomla_52178/images/pages/page4-img1.jpg" class="lazy" alt="" style="display: block;"></span>";
                 //    ltrEvents.Text += "                   </a>";
                 //   ltrEvents.Text += "            </figure>";
                 //   ltrEvents.Text += "    <div class="itemInner">";
                 //   ltrEvents.Text += "                <h4 class="item_title item_title__ visible-first">";
                 //   ltrEvents.Text += "            <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">Homes</span> <span class="item_title_part1 item_title_part_even item_title_part_first_half">&amp;</span> <span class="item_title_part2 item_title_part_odd item_title_part_second_half">Facilities</span> 		</h4>";
                 //    ltrEvents.Text += "       <div id="Div6"></div>";
                 //      ltrEvents.Text += "     <div class="item_introtext">";
                 //      ltrEvents.Text += "         <p>Santiumorem ipsum dolor sit ametec on sectetur adipiscing elit. Suspend is se consectetur dignis sim felis quis va rius. Pellentesque in vestibulu sapien.  Aenean id mi et nunc vehicula</p>";
                 //      ltrEvents.Text += "     </div>";
                 //       ltrEvents.Text += "    <a class="btn btn-info readmore custom_hover" href="/joomla_52178/index.php/give/36-giving-catalog/79-homes-facilities"><span><span><span>Read more</span></span><strong><span>Read more</span></strong></span></a>";
                 //     ltrEvents.Text += "  </div>";
                 //     ltrEvents.Text += "  </div>";


               // ltrEvents.Text += " <article class=\"span6 item item_num0 item__module   visible-first\" id=\"item_79\">";
                ltrEvents.Text += "      <div class=\"item_content\">";
                ltrEvents.Text += "          <figure class=\"item_img img-intro img-intro__left\">";
                ltrEvents.Text += "              <a href='EventDescription.aspx?id=" + dr["Id"].ToString() + "&cn=" + dr["Title"].ToString() + "'>";
                ltrEvents.Text += "                  <span class=\"lazy_container lazyloaded\" style=\"width: 252px;\"><span class=\"lazy_preloader\" style=\"padding-top: 86.507936507937%;\"></span>";
                ltrEvents.Text += "                      <img src='Upload/" + dr["ImageUrl"].ToString() + "' class=\"lazy\" alt=\"\" style=\"display: block;\"></span>";
                ltrEvents.Text += "              </a>";
                ltrEvents.Text += "          </figure>";
                ltrEvents.Text += "          <div class=\"itemInner\">";
                ltrEvents.Text += "              <h4 class=\"item_title item_title__ visible-first\">";
                ltrEvents.Text += "                 <span class=\"item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first\">";
                ltrEvents.Text += " " + dr["Title"].ToString() + "</span></h4>";
                ltrEvents.Text += "             <div class=\"item_introtext\">";
                ltrEvents.Text += "<p>";
                ltrEvents.Text += "<b>" + dr["Place"].ToString() + "</b>";
                ltrEvents.Text += "</p>";
                ltrEvents.Text += "<p>";
                ltrEvents.Text += "<b style='color:#FC6A00'>" + dr["EventDate"].ToString() + "</b>";
                ltrEvents.Text += "</p>";
                ltrEvents.Text += "           </div>";
                ltrEvents.Text += "           <a class=\"btn btn-info readmore custom_hover\" href='EventDescription.aspx?id=" + dr["Id"].ToString() + "&cn=" + dr["Title"].ToString() + "'><span><span><span>Read more</span></span><strong><span>Read more</span></strong></span></a>";
                ltrEvents.Text += "       </div>";
                ltrEvents.Text += "    </div>";
                ltrEvents.Text += "    <div class=\"clearfix\"></div>";
               // ltrEvents.Text += "  </article>";


            }
        }
    }
}