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

public partial class About : System.Web.UI.Page
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            DataSet ds = obj.GetAboutUS();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ltrDetails.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                kidsPhoto.ImageUrl = "Upload/" + ds.Tables[0].Rows[0]["ImageUrl"].ToString();
            }
        }
    }
}