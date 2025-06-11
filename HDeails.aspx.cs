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

public partial class HDeails : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (Request.QueryString["Id"] == "" || Request.QueryString["Id"] == null || Request.QueryString["cn"] == "" || Request.QueryString["cn"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            Page.Header.Title = Request.QueryString["cn"];
            lblSubName.Text = Request.QueryString["cn"];
            if (!IsPostBack)
            {
                Bind_Grid();
            }
        }
    }

    protected void Bind_Grid()
    {

        DataSet ds = obj.GetHomeDeatilsByID(Convert.ToInt32(Request.QueryString["Id"]));

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr1;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr1 = ds.Tables[0].Rows[i];

                lblSubName.Text= dr1["Title"].ToString();
                ltrDetails.Text = dr1["Description"].ToString();

            }
        }

    }
}