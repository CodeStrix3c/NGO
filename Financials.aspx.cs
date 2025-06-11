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


public partial class Financials : System.Web.UI.Page
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

        DataSet ds = obj.GetFinancials_FE();
        if (ds.Tables[0].Rows.Count > 0)
        {
            //lblTitle.Text = " <h3 class=\"moduleTitle color\"> <span class=\"item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first\">RESOURCES </span>  </h3>";
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];

                ltrDetails.Text += "<tr class=\"krow2 krow2\" id=\"kcat2\">";
                ltrDetails.Text += "<td class=\"kcol-first kcol-category-icon hidden-phone\">";
                ltrDetails.Text += "" + dr["Title"].ToString() + "";      
                ltrDetails.Text += "</td>";

                ltrDetails.Text += "<td class=\"kcol-mid kcol-kcattitle\" >";
                ltrDetails.Text += "<div class=\"kthead-title kl\">";
                ltrDetails.Text += "<a href='Upload/" + dr["ForeignFunds"].ToString() + "' target='_blanck' rel=\"follow\" title=\"View Category\">" + "Foreign Funds" + "</a>";
                ltrDetails.Text += "</div>";
                ltrDetails.Text += "</td>";

                ltrDetails.Text += "<td class=\"kcol-mid kcol-kcattitle\" >";
                ltrDetails.Text += "<div class=\"kthead-title kl\">";
                ltrDetails.Text += "<a href='Upload/" + dr["DomesticFunds"].ToString() + "' target='_blanck' rel=\"follow\" title=\"View Category\">" + "Domestic Funds" + "</a>";
                ltrDetails.Text += "</div>";
                ltrDetails.Text += "</td>";

                ltrDetails.Text += "  </tr>";


            }
        }
    }
}