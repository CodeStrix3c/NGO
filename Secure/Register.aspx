<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Alhayat_Ad_Register" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="../Control/Footer.ascx" TagName="Footer" TagPrefix="ccl" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Register Page</title>
    <link href="../Style/Admin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Script/Admin.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="page">
        <div id="sidebar">
		</div>
        <div id="content">
        <div></div>
		<div class="boxed">
		<center>
		<a href="Default.aspx">Login</a>
		<br />
               <table cellpadding="3" cellspacing="3" border="0">
                <tr>
                    <td align="left" valign="top">
                        FullName
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtFullName" runat="Server"></asp:TextBox>
                    </td>
                </tr>
                    <tr>
                    <td align="left" valign="top">
                        Designation
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtDesignation" runat="Server" Width="155px"></asp:TextBox>
                    </td>
                </tr>
                  <tr>
                    <td align="left" valign="top">
                        Address
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtAddress" runat="Server" TextMode="MultiLine" Width="155px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td align="left" valign="top">
                        Contact No
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtContact" runat="Server" Width="155px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td align="left" valign="top">
                        Email ID
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtEmailID" runat="Server" Width="155px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td align="left" valign="top">
                        UserName
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtUserName" runat="Server" Width="155px"></asp:TextBox>
                    </td>
                </tr>
                  <tr>
                    <td align="left" valign="top">
                        UserPassword
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtPassword" runat="Server" TextMode="Password" Width="155px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td align="left" valign="top">
                    </td>
                    <td align="right" valign="top">
                        <asp:ImageButton ID="btnRegister" runat="Server" ImageUrl="~/AlbumImages/button-add.gif" OnClick="btnRegister_Click1" OnClientClick="return Register()" />
                    </td>
                </tr>
            </table>
        </center>
        </div>
        </div>
        </div>
        <ccl:Footer ID="footer" runat="Server" />
    </form>
</body>
