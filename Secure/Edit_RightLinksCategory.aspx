<%@ Page Title="Edit Right Link Category" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Edit_RightLinksCategory.aspx.cs" Inherits="Secure_Edit_RightLinksCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<h3>
      Category</h3>
    <table width="100%">
        <tr>
            <td align="left" valign="top">
                <table>
                    <tr>
                        <td align="left" valign="top" style="width: 405px">
                            <fieldset>
                                <legend>Edit Category</legend>
                                <p>
                                </p>
                                        <table>
                                            <tr>
                                                <td align="left" valign="top">
                                                     Category Name:
                                                </td>
                                                <td align="left" valign="top">
                                                    <asp:TextBox ID="txtTitle" runat="server" Width="300px" CssClass="textfield"></asp:TextBox>
                                                   <asp:RequiredFieldValidator runat="server" ID="rfv" ControlToValidate="txtTitle"
                                                ErrorMessage="Name is required" Display="Dynamic" SetFocusOnError="true"  ValidationGroup="vgBanner" ></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        
                                        </table>
                                        <p style="text-align: right;">
                                            <asp:ImageButton ID="btnSave" runat="server" CommandName="Insert" ImageUrl="../AlbumImages/button-save.gif"
                                              onclick="btnSave_Click" ValidationGroup="vgBanner" />
                                        </p>
                                   
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
            
        </tr>
    </table>
</asp:Content>

