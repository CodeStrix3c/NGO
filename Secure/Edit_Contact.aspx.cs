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

public partial class FazilKashmir_Ad_Edit_Contact : System.Web.UI.Page
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (Request.QueryString["ID"] == "" || Request.QueryString["ID"] == null)
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
        DataSet ds = obj.GetContactUsByID(Convert.ToInt32(Request.QueryString["ID"]));
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                txtName.Text = dr["Name"].ToString();
                txtAddress.Text = dr["Address"].ToString();
                //txtContactNo.Text = dr["Phone"].ToString();
                //txtMobileno.Text = dr["MobileNo"].ToString();
                //txtFax.Text = dr["FaxNo"].ToString();
                //txtEmail.Text = dr["Email"].ToString();
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
        theSQL = " UPDATE Contacts  SET";
        theSQL += " Name ='" + txtName.Text.Replace("'", "''") + "',";
        theSQL += " Address ='" + txtAddress.Text.Replace("'", "''") + "',";
        //theSQL += " Phone ='" + txtContactNo.Text.Replace(",", "''") + "', ";
        //theSQL += " MobileNo ='" + txtMobileno.Text.Replace(",", "''") + "', ";
        //theSQL += " FaxNo ='" + txtFax.Text.Replace(",", "''") + "', ";
        //theSQL += " Email ='" + txtEmail.Text.Replace(",", "''") + "', ";
        theSQL += " CreatedDate ='" + obj.ReturnDate() + "'";
        theSQL += " WHERE ID =" + Convert.ToInt32(Request.QueryString["ID"]);
        theSQL = obj.EditContact(theSQL);
        if (theSQL == "Success")
        {
            Response.Redirect("View_Contacts.aspx");
        }
    }
}
