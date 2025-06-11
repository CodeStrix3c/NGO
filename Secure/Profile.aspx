<%@ Page Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="FazilKashmir_Ad_Profile" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<script type="text/javascript">
function Chk_Profile()
{
    var theForm=aspnetForm;
    var msg="";
    var cnt=0;
    if(theForm.ctl00$CPH$txtName.value=="")
    {
        alert("User Name Required!");
        theForm.ctl00$CPH$txtName.focus();
        cnt++;
        return false;
    }
    if(theForm.ctl00$CPH$txtNewPassword.value=="")
    {
        alert("Password Required!");
        theForm.ctl00$CPH$txtNewPassword.focus();
        cnt++;
        return false;
    }
    if(theForm.ctl00$CPH$txtConfirmPassword.value=="")
    {
        alert("Confirm Password Required!");
        theForm.ctl00$CPH$txtConfirmPassword.focus();
        cnt++;
        return false;
    }
    if(cnt>0)
    {
        return false;
    }
    else
    {
        if(theForm.ctl00$CPH$txtNewPassword.value==theForm.ctl00$CPH$txtConfirmPassword.value)
        {
            return true;
        }
        else
        {
             alert("New Password and Confirm Password Doesnot match!");
             theForm.ctl00$CPH$txtConfirmPassword.focus();
             cnt++;
             return false;
        }
    }
}
</script>
<h3>Profile</h3>
<fieldset>
<legend>Edit Profile</legend>
<table cellpadding="2" cellspacing="2" border="0" width="100%">
   <tr>
        <td align="center" valign="top">
            <table cellpadding="2" cellspacing="2" border="0" >
                <tr>
                    <td align="left" valign="top">
                        UserName
                    </td>
                    <td align="left" valign="top">
                      <asp:TextBox ID="txtName" runat="server" Width="145px"></asp:TextBox>
                    </td>
               </tr>
                <tr>
                     <td align="left" valign="top">
                       New Password
                    </td>
                    <td align="left" valign="top">
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" Width="145px"></asp:TextBox>
                    </td>
                </tr>
                  <tr>
                     <td align="left" valign="top">
                       Confirm Password
                    </td>
                    <td align="left" valign="top">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="145px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                     <td align="left" valign="top">
                    </td>
                    <td align="right" valign="top">
                    <asp:ImageButton ID="btnSave" runat="server" ImageUrl="../AlbumImages/button-save.gif" OnClick="btnSave_Click" OnClientClick="return Chk_Profile()" />
                    </td>
                </tr>
            </table>
        </td>
   </tr>
</table>
</fieldset>
</asp:Content>

