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

public partial class Secure_Add_AboutShehjar : System.Web.UI.Page
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            string theSQL = "";
            DataSet ds = obj.GetAboutShehjar();
            if (ds.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                DataRow dr;
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    dr = ds.Tables[0].Rows[i];
                    txtDescription.Text = dr["Description"].ToString();
                }
            }
        }
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        string theSQL = "";
        DataSet ds = obj.GetAboutShehjar();
        if (ds.Tables[0].Rows.Count > 0)
        {
            theSQL = "Update AboutShehjar SET Description='" + txtDescription.Text.Replace("'", "''") + "' ,ModifiedDate='" + obj.ReturnDate() + "'";
            MsgBox.Show(obj.UpdateData(theSQL));
        }
        else
        {
            theSQL = "INSERT INTO AboutShehjar(Description,CreatedDate,ModifiedDate) VALUES(";
            theSQL += "'" + txtDescription.Text.Replace("'", "''") + "',";
            theSQL += "'" + obj.ReturnDate() + "',";
            theSQL += "'" + obj.ReturnDate() + "'";
            theSQL += ")";
            MsgBox.Show(obj.InsertData(theSQL));
        }
    }
}