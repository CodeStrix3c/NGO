<%@ Page Title="Edit Speaker" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Edit_Speaker.aspx.cs" Inherits="FazilKashmir_Ad_Edit_Speaker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<h3>Speaker</h3>
 <input type="hidden" id="hdnth1" runat="server" />
    <fieldset>
        <legend>Enter details below:</legend>
        <table>
        <tr>
         <asp:Label ID="of1" runat="Server"></asp:Label>
        <td>
        </td>
        </tr>
        </table>

        <table cellpadding="3" cellspacing="3" border="0">
            <tbody>
               
                <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                        Speaker Name:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtName" runat="Server" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="txtName" ErrorMessage="Name is required" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>

                    </td>
                </tr>

                  <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                        Address:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtAddress" runat="Server" Width="300px"></asp:TextBox>

                    </td>
                </tr>

                 <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                        Contact:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtContactNo" runat="Server" Width="300px"></asp:TextBox>

                    </td>
                 </tr>

                    <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                        Choose Photo :
                    </td>
                    <td align="left" valign="top">
                        <asp:FileUpload ID="Ofile" runat="server" Width="300px"  onchange="javascript:chkOfile();"/>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Ofile" Display="Dynamic" ErrorMessage="Invalid file formate" ValidationExpression="^.+(.jpg|.gif|.png|.JPG|.GIF|.PNG)$" ValidationGroup="Writer"></asp:RegularExpressionValidator>
                    </td>
                  </tr>

                 <tr>
                    <td align="right" valign="top">
                    </td>
                   <td align="right" valign="top">
                        <asp:ImageButton ID="btnSave" runat="server" ImageUrl="../AlbumImages/button-save.gif"
                            AlternateText="Save" ValidationGroup="Writer"
                            onclick="btnSave_Click"  />
                    </td>
                </tr>

            </tbody>
        </table>

    </fieldset>

</asp:Content>

