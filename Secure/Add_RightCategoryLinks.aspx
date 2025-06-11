<%@ Page Title="Links" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Add_RightCategoryLinks.aspx.cs" Inherits="Secure_Add_RightCategoryLinks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
   <h3>Add Category</h3>
    <fieldset>
        <legend>Enter details below:</legend>
        <table cellpadding="3" cellspacing="3" border="0">
            <tbody>
               
                <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                      Category Name:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtName" runat="Server" Width="300px" Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="txtName" ErrorMessage="Name is required" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>

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
                                       <asp:Label ID="lblWriterName" runat="server" Font-Size="14px" Text='<%# Bind("Title") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField  HeaderText="Add Details"> 
                                    <ItemTemplate>
                                       <a href='Add_RightLinksCategoryDetails.aspx?CatID=<%#Eval("ID") %>'>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/AlbumImages/button-add.gif" AlternateText="Add" />
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Update">
                                    <ItemTemplate>
                                        <a href='Edit_RightLinksCategory.aspx?ID=<%#Eval("ID") %>'>
                                            <asp:Image ID="imgBtnEdit" runat="server" ImageUrl="../AlbumImages/im_edit.jpg" AlternateText="Edit" />
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgBtnDel" runat="server" CausesValidation="False" CommandName="Delete"
                                            ImageUrl="../AlbumImages/im_delete.jpg" AlternateText="Delete"  OnClientClick = "return confirm('Do you want to delete?')"></asp:ImageButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                        <EditRowStyle BackColor="#999999" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Left" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left"/>
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Left" />
                        </asp:GridView>
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>
</asp:Content>

