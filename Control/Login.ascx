<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="Control_Login" %>
<div class="box">
<table cellpadding="2" cellspacing="2" border="0">
    <tr>
        <td align="left" valign="top">
            Username:
        </td>
        <td align="left" valign="top" >
            <input type="text" id="txtUserName" runat="server"  size="20"/>
        </td>
    </tr>
      <tr>
        <td align="left" valign="top" style="height: 24px">
            Password:
        </td>
        <td align="left" valign="top" >
            <input type="password" id="txtPassword" runat="server" size="22" />
        </td>
    </tr>
      <tr>
        <td align="left" valign="top">
        </td>
        <td align="right" valign="top" >
            <asp:ImageButton ID="btnSubmit" runat="Server" ImageUrl="../AlbumImages/button-login.gif" OnClick="btnSubmit_Click" />
        </td>
    </tr>
</table>
</div>