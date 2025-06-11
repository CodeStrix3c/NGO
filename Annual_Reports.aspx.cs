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


public partial class Annual_Reports : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
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
        DataSet ds = obj.GetAnnualReportTop50();
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr1;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr1 = ds.Tables[0].Rows[i];


                ltrData.Text += "  <div class=\"jg_subcatelem_cat\">";
                ltrData.Text += "                 <div class=\"jg_imgalign_catsubs\">";
                ltrData.Text += "                   <div class=\"jg_subcatelem_photo\">";
                ltrData.Text += "                      <a href='Upload/" + dr1["Url"].ToString() + "'  target=\"_blank\">";
                ltrData.Text += "                       <span class=\"lazy lazy_container lazyloaded\" style=\"width: 347px;\"><span class=\"lazy lazy_preloader\" style=\"padding-top: 80.691642651297%;\"></span>";
                ltrData.Text += "                          <img src=\"images/Downloads-icon.png\" hspace=\"4\" vspace=\"0\" class=\"lazy jg_photo\" alt=\"First Category\" style=\"display: block;\">";
                ltrData.Text += "                      </span>";
                ltrData.Text += "                    </a>";
                ltrData.Text += "                 </div>";
                ltrData.Text += "               <div class=\"jg_subcatelem_txt\">";
                ltrData.Text += "                <a class=\"jg_subcatelem_txt__link\" href='Upload/" + dr1["Url"].ToString() + "' target=\"_blank\"></a>";
                ltrData.Text += "                 <ul>";
                ltrData.Text += "                  <li class=\"lastItem firstItem\">";
                ltrData.Text += "                  " + dr1["Title"].ToString() + "   ";
                ltrData.Text += "              </li>";
                ltrData.Text += "            </ul>";
                ltrData.Text += "          </div>";
                ltrData.Text += "         </div>";
                ltrData.Text += "       </div>";



            }
        }


    }
}