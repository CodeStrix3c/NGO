<%@ Page Title="Menu Sub Category" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="MenuSubCategory.aspx.cs" Inherits="Secure_MenuSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" runat="Server">
    <h3>Sub Category</h3>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td align="left" valign="top" style="width: 738px">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td align="left" valign="top" style="width: 298px">
                            <fieldset>
                                <legend>Add Sub Links</legend>
                                <table>
                                    <tr>
                                        <td align="right" valign="top">Title: 
                                        </td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtTitle" runat="server" CssClass="textfield" Width="418px"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtTitle" ErrorMessage="Title is required" Display="Dynamic" ValidationGroup="KidsPage"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" valign="top">Banner Image : 
                                        </td>
                                        <td align="left" valign="top">
                                            <asp:FileUpload ID="Ofile" runat="server" />
                                            <br />
                                            (image should be width 1290px & height 400px)
                                            <asp:RequiredFieldValidator runat="server" ID="rfv" ControlToValidate="Ofile" ErrorMessage="Image is required" Display="Dynamic" ValidationGroup="KidsPage"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>

                                      <tr>
                                        <td align="right" valign="top">Image : 
                                        </td>
                                        <td align="left" valign="top">
                                            <asp:FileUpload ID="uploadImg" runat="server" />
                                            <br />
                                            (image should be width 600px & height 400px)
                                           <%-- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="uploadImg" ErrorMessage="Image is required" Display="Dynamic" ValidationGroup="KidsPage"></asp:RequiredFieldValidator>--%>
                                        </td>
                                      </tr>

                                    <tr>
                                        <td></td>
                                        <td align="right" valign="top">
                                            <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="../AlbumImages/button-save.gif" OnClick="imgAdd_Click" ValidationGroup="KidsPage" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>


                        </td>

                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <h3>Category List</h3>
    <fieldset>
        <legend>List below:</legend>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tbody>
                <tr>
                    <td align="left" valign="top">
                        <asp:Label ID="lblMessage" runat="server" Width="100%" Visible="false"></asp:Label>
                        <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="25" AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowFooter="True" AllowSorting="True" OnRowDeleting="Grid_RowDeleting"
                            OnSorting="gridView_Sorting" OnPageIndexChanging="Grid_PageIndexChanging"
                            CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="Category" HeaderStyle-Width="450px">
                                    <ItemTemplate>
                                        <br />
                                        <asp:Label ID="lblWriterName" runat="server" Font-Size="14px" Text='<%# Bind("Title") %>'></asp:Label>
                                        <br />
                                        <br />
                                        <img alt="" src="../Upload/<%#(Eval("ImageUrl"))%>" style="width: 200px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Add Details">
                                    <ItemTemplate>
                                        <a href='MenuDetails.aspx?SubCatID=<%#Eval("ID") %>'>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/AlbumImages/button-add.gif" AlternateText="Add" />
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Update">
                                    <ItemTemplate>
                                        <a href='Edit_MenuSubCategory.aspx?ID=<%#Eval("ID") %>&CatID=<%# Eval("CatID") %>'>
                                            <asp:Image ID="imgBtnEdit" runat="server" ImageUrl="../AlbumImages/im_edit.jpg" AlternateText="Edit" />
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgBtnDel" runat="server" CausesValidation="False" CommandName="Delete"
                                            ImageUrl="../AlbumImages/im_delete.jpg" AlternateText="Delete" OnClientClick="return confirm('Do you want to delete?')"></asp:ImageButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                            <EditRowStyle BackColor="#999999" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Left" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Left" />
                        </asp:GridView>
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>
</asp:Content>

