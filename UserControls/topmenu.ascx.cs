using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class UserControls_topmenu : System.Web.UI.UserControl
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            ltrLinks.Text = this.Render_Links();
        }
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