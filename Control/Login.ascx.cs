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

public partial class Control_Login : System.Web.UI.UserControl
{
    protected Member myMember;
    protected void Page_Load(object sender, EventArgs e)
    {
        myMember = new Member();
        if (Request.QueryString["OD"] == "LO")
        {
            Session["ID"] = null;
            Session["RoleID"] = null;
            Response.Redirect("Default.aspx");
        }

    }
    protected void btnSubmit_Click(object sender, ImageClickEventArgs e)
    {
        myMember.Password = txtPassword.Value;
        myMember.UserName = txtUserName.Value;
        if (myMember.IsValidMember())
        {
            Session["ID"] = myMember.ID;
            Session["RoleID"] = myMember.RoleID;
            Session["UserName"] = txtUserName.Value;
            if (myMember.RoleID == 9)
            {
                Response.Redirect("Home.aspx");
            }
            else 
            {
                Response.Redirect("../User/");
            }
        }
    }
}
