<%@ Page Title="Edit Partners" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Edit_Partners.aspx.cs" Inherits="Secure_Edit_Partners" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<h3>
        Partners</h3>
    <table width="100%">
        <tr>
            <td align="left" valign="top">
                <table>
                    <tr>
                        <td align="left" valign="top" style="width: 395px">
                            <fieldset>
                                <legend>Edit details below:</legend>
                                <p>
                                </p>
                                        <table>
                                    <tr>
                                        <td align="right" style="font-weight: bold" valign="top">
                                            Title</td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="txtTitle" ErrorMessage="Title is required" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>                                       
                                         </td>
                                      </tr>
                                      
                                        <tr>
                                        <td align="right" style="font-weight: bold" valign="top">
                                            Url</td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtUrl" runat="server" Width="300px"></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtUrl" runat="server" ErrorMessage="Invalid Url" ValidationExpression="^(ht|f)tp(s?)://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$" ValidationGroup="Writer"></asp:RegularExpressionValidator>
                                         </td>
                                       </tr>
                                        </table>
                                        <p style="text-align: right;">
                                            <asp:ImageButton ID="btnSave" runat="server" CommandName="Insert" ImageUrl="../AlbumImages/button-save.gif"
                                               onclick="btnSave_Click"  ValidationGroup="Writer"/>
                                        </p>
                                   
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
            
        </tr>
    </table>
</asp:Content>

