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


public partial class Careers : System.Web.UI.Page
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

        DataSet ds = obj.GetCareers();

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr1;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr1 = ds.Tables[0].Rows[i];

                if (!string.IsNullOrEmpty(dr1["ImageUrl"].ToString()))
                {
                    ltrcarrer.Text += " <div class=\"mod-newsflash-adv mod-newsflash-adv__ cols-1\" id=\"Div1\">";
                    ltrcarrer.Text += "<a href='Upload/" + dr1["ImageUrl"].ToString() + "' target=\"_blank\">" + dr1["Title"].ToString() + "</a> ";
                    ltrcarrer.Text += " </div><hr><br/>";
                }
                else
                {
                    ltrcarrer.Text += " <header><h3 class=\"moduleTitle \">";
                    ltrcarrer.Text += "<span class=\"item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first\">";
                    ltrcarrer.Text += "" + dr1["Title"].ToString() + "";
                    ltrcarrer.Text += "</span> ";
                    ltrcarrer.Text += " </h3>";
                    ltrcarrer.Text += " </header>";
                    ltrcarrer.Text += " <div class=\"mod-newsflash-adv mod-newsflash-adv__ cols-1\" id=\"Div1\">";
                    ltrcarrer.Text += "" + dr1["Description"].ToString() + "";
                    ltrcarrer.Text += " <div class=\"clearfix\"></div>";
                    ltrcarrer.Text += " </div><hr><br/>";
                }


                // lblSubName.Text = dr1["Title"].ToString();
                //  ltrDetails.Text = dr1["Description"].ToString();
                // kidsPhoto.ImageUrl = "Upload/" + ds.Tables[0].Rows[0]["ImageUrl"].ToString();

            }
        }

    }
}