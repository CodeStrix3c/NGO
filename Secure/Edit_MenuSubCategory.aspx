<%@ Page Title="Edit Menu Sub Category" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Edit_MenuSubCategory.aspx.cs" Inherits="Secure_Edit_MenuSubCategory" %>

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
                                                ErrorMessage="Name is required" Display="Dynamic" SetFocusOnError="true"  ValidationGroup="KidsPage" ></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        
                                              <tr>
                                                <td align="right" valign="top" >
                                                Image : 
                                                </td>
                                                <td align="left" valign="top">
                                                <asp:FileUpload ID="Ofile" runat="server" />
                                                <asp:Image ID="kidsPhoto" runat="server" Width="200px"/>
                                                <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="Ofile" ErrorMessage="Image is required" Display="Dynamic" ValidationGroup="KidsPage"></asp:RequiredFieldValidator>
                                                <br /> (image should be width 1290px & height 400px) 
                                                </td>
                                                </tr>

                                               <tr>
                                                <td align="right" valign="top">Image : 
                                                </td>
                                                <td align="left" valign="top">
                                                    <asp:FileUpload ID="uploadImg" runat="server" />
                                                    <br />
                                                    (image should be width 600px & height 400px)
                                                     <asp:Image ID="Image1" runat="server" Width="200px"/>
                                                   <%-- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="uploadImg" ErrorMessage="Image is required" Display="Dynamic" ValidationGroup="KidsPage"></asp:RequiredFieldValidator>--%>
                                                </td>
                                              </tr>



                                        </table>
                                        <p style="text-align: right;">
                                            <asp:ImageButton ID="btnSave" runat="server" CommandName="Insert" ImageUrl="../AlbumImages/button-save.gif"
                                              onclick="btnSave_Click" ValidationGroup="KidsPage" />
                                        </p>
                                   
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
            
        </tr>
    </table>
</asp:Content>

