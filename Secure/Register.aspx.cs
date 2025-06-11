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

public partial class Alhayat_Ad_Register : System.Web.UI.Page
{
    protected Member iObj;
    protected void Page_Load(object sender, EventArgs e)
    {
        iObj = new Member();
    }
   
    protected void btnRegister_Click1(object sender, ImageClickEventArgs e)
    {
        iObj.FullName = txtFullName.Text.Replace("'", "''");
        iObj.Address = txtAddress.Text.Replace("'", "''");
        iObj.Designation = txtDesignation.Text.Replace("'", "''");
        iObj.ContactNo = txtContact.Text.Replace("'", "''");
        iObj.EmailID = txtEmailID.Text.Replace("'", "''");
        iObj.UserName = txtUserName.Text.Replace("'", "''");
        iObj.Password = txtPassword.Text.Replace("'", "''");
        iObj.RoleID = 8;
        MsgBox.Show(iObj.Register());
    }
}
