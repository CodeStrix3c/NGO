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

public partial class Admin_Profile : System.Web.UI.Page
{
    protected Member myMember;
    protected void Page_Load(object sender, EventArgs e)
    {
        myMember = new Member();
        if (!IsPostBack)
        {
            Bind_Data();
        }
    }
    protected void Bind_Data()
    {
        myMember.ID = Convert.ToInt32(Session["ID"]);
        DataSet ds = myMember.GetDetails();
        if (ds.Tables[0].Rows.Count > 0)
        {
            int i = 0;
            DataRow dr;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                txtName.Text = dr["UserName"].ToString();

            }

        }
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        myMember.ID = Convert.ToInt32(Session["ID"]);
        myMember.UserName = txtName.Text;
        myMember.Password = txtNewPassword.Text;
       MsgBox.Show(myMember.UpdateProfile());
        txtNewPassword.Text = "";
        txtConfirmPassword.Text = "";
        Bind_Data();
    }
}
