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

public partial class UserControls_ShehjarCategory : System.Web.UI.UserControl
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

        ltrShehjarCategory.Text += "<div class=\"tabber\">";
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
              dr = ds.Tables[0].Rows[i];
              ltrShehjarCategory.Text += "<div class=\"tabbertab\">";
	          ltrShehjarCategory.Text += "<h2>" + dr["Title"].ToString() + "</h2>";
	          ltrShehjarCategory.Text += "<p>";
              ltrShehjarCategory.Text += "<img src='Upload/" + dr["ImageUrl"].ToString() + "' Title='" + dr["Title"].ToString() + "' style='float:left; padding-right:5px'/>";
              ltrShehjarCategory.Text += "" + dr["Intro"].ToString() + "";
              ltrShehjarCategory.Text += "<br/>";
              ltrShehjarCategory.Text += "<a href='ShehjarDescription.aspx?Id=" + dr["ID"].ToString() + "'>";
              ltrShehjarCategory.Text += "<img src='images/read_more_icon.jpg' style='border:0px'/>";
               ltrShehjarCategory.Text += "</a>"; 
              ltrShehjarCategory.Text += "</p>";
              ltrShehjarCategory.Text += "</div>";
            }
        }
        ltrShehjarCategory.Text += "</div>";
    }
}