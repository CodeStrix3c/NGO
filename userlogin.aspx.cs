using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userlogin : System.Web.UI.Page
{
    protected Member myMember;
    protected void Page_Load(object sender, EventArgs e)
    {
        myMember = new Member();
        if (Request.QueryString["OD"] == "LO")
        {
            Session["Id"] = null;
            Session["RoleID"] = null;
            Response.Redirect("Default.aspx");
        }
        divmesg.Visible = false;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        myMember.Password = RijndaelSimple.Encrypt(Request.Form["lpassword"]);
        myMember.EmailID = Request.Form["lemail"];
        if (myMember.IsValidUser())
        {
            Session["Id"] = myMember.ID;
            Session["RoleID"] = myMember.RoleID;
            Session["EmailID"] = Request.Form["lemail"];
            if (myMember.RoleID == 9)
            {
                divmesg.Visible = false;
                Response.Redirect("userdetails.aspx");
            }
            else
            {
                //Response.Redirect("../User/");
            }
        }
        else
        {
            divmesg.Visible = true;
            lblmessage.Text = "Authentication failed. You entered an incorrect email or password.";
        }
    }
}