using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class donate : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (!IsPostBack)
        {

            ltrLinks.Text = this.Render_Links();

            //if (String.IsNullOrEmpty(Session["lblName"].ToString()))
            //{
            //    string strqry = Request.QueryString["cn"];
            //    strqry = strqry.Replace("-", " ");
            //    Session["lblname"] = strqry;
            //}


           // lblCName.Text = Session["lblname"].ToString();
        }
    }
    public string RandomDigits(int length)
    {
        var random = new Random();
        string s = string.Empty;
        for (int i = 0; i < length; i++)
            s = String.Concat(s, random.Next(10).ToString());
        return s;
    }


    public string Render_Links()
    {
        StringBuilder sb_HTML = new StringBuilder();
        DataSet ds = obj.GetTerms();
        if (ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr_SC in ds.Tables[0].Rows)
            {
                sb_HTML.Append("<li>");
                sb_HTML.Append("<a href='terms.aspx?Id=" + dr_SC["Id"].ToString() + "&cn=" + dr_SC["Title"].ToString() + "' title='" + dr_SC["Title"].ToString() + "'> ");
                sb_HTML.Append(" " + dr_SC["Title"].ToString() + "");
                sb_HTML.Append("</a></li>");
                
            }
        }

        return sb_HTML.ToString();

    }
}