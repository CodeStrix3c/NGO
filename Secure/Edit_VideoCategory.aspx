<%@ Page Title="Edit Video Subject" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Edit_VideoCategory.aspx.cs" Inherits="Secure_Edit_VideoCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<h3>
      Edit Video Subject</h3>
    <table width="100%">
        <tr>
            <td align="left" valign="top">
                <table>
                    <tr>
                        <td align="left" valign="top" style="width: 395px">
                            <fieldset>
                                <legend>Edit Category</legend>
                                <p>
                                </p>
                                        <table>
                                            <tr>
                                                <td align="left" valign="top">
                                                     Subject:
                                                </td>
                                                <td align="left" valign="top">
                                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="textfield"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="txtTitle" ErrorMessage="Subject is required" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        
                                        </table>
                                        <p style="text-align: right;">
                                            <asp:ImageButton ID="btnSave" runat="server" CommandName="Insert" ImageUrl="../AlbumImages/button-save.gif"
                                                onclick="btnSave_Click" />
                                        </p>
                                   
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
            
        </tr>
    </table>
</asp:Content>

