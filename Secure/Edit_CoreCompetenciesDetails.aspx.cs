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

public partial class Secure_Edit_CoreCompetenciesDetails : System.Web.UI.Page
{
    protected iLayer obj;
    protected static int varID;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (Request.QueryString["ID"] == "" || Request.QueryString["ID"] == null || Request.QueryString["CatId"] == "" || Request.QueryString["CatId"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            varID = Convert.ToInt32(Request.QueryString["CatId"]);
            if (!IsPostBack)
            {
                Bind_Grid();
            }
        }
    }
    protected void Bind_Grid()
    {
        DataSet ds = obj.GetCompetenciesDetailsByID(Convert.ToInt32(Request.QueryString["ID"]));
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                txtTitle.Text = dr["Title"].ToString();
                txtDescription.Text = dr["Description"].ToString();
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }

    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        string theSQL = "";
        theSQL = " UPDATE CompetenciesDetails SET";
        theSQL += " Title='" + txtTitle.Text.Replace("'", "''") + "',";
        theSQL += " Description='" + txtDescription.Text.Replace("'", "''") + "'";
        theSQL += " WHERE ID=" + Convert.ToInt32(Request.QueryString["ID"]);

        theSQL = obj.UpdateNews(theSQL);
        if (theSQL == "Success")
        {
            Response.Redirect("Add_CoreCompetenciesDetails.aspx?CatID=" + varID);
        }
    }
}