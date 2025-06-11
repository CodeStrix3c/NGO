using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;

public partial class BlogDescription : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (Request.QueryString["Id"] == "" || Request.QueryString["Id"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {

            if (!IsPostBack)
            {
                Bind_Grid();
            }
        }
    }
    protected void Bind_Grid()
    {
        DataSet ds = obj.GetBlogByID(Convert.ToInt32(Request.QueryString["ID"]));
        Grid.DataSource = ds;
        Grid.DataBind();
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            string theSQL = "";
            theSQL += "INSERT INTO BlogComments(BlogId,Name,Email,Message,CreatedDate) VALUES(";
            theSQL += "'" + Convert.ToInt32(Request.QueryString["ID"].ToString().Replace("'", "''")) + "',";
            theSQL += "'" + txtCName.Text.Replace("'", "''") + "',";
            theSQL += "'" + txtEmailID.Text.Replace("'", "''") + "',";
            theSQL += "'" + txtMessage.Text.Replace("'", "''") + "',";
            theSQL += "'" + obj.ReturnDate() + "'";
            theSQL += ")";
            obj.InsertData(theSQL);
            MsgBox.Show("Success");
            resentfields();
        }
        catch { }
    }
    public void resentfields()
    {
        txtEmailID.Text = string.Empty;
        txtMessage.Text = string.Empty;
        txtCName.Text = string.Empty;
    }
}