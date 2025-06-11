<%@ Page Title="Board Manager" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="View_BoardManager.aspx.cs" Inherits="Secure_View_BoardManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
    <h3>Board Manager</h3>
    <fieldset>
        <legend>List below:</legend>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tbody>
                <tr>
                    <td align="left" valign="top">
                        <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="25" AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowFooter="True" AllowSorting="True" OnRowDeleting="Grid_RowDeleting"
                            OnSorting="gridView_Sorting" OnPageIndexChanging="Grid_PageIndexChanging" CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None">
                            <Columns>

                                <asp:TemplateField HeaderText="Photo">
                                    <ItemTemplate>
                                       <img alt="" src="../Upload/<%#(Eval("ImageUrl"))%>" style="padding-right:10px; padding-bottom:10px; padding-top:10px; padding-left:5px"/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                              <asp:TemplateField  HeaderText="Name">
                                    <ItemTemplate>
                                       <asp:Label ID="lblMName" runat="server" Font-Bold="true" ForeColor="Blue" Text='<%# Bind("MName") %>'></asp:Label><br />
                                       <asp:Label ID="lblPosition" runat="server" Font-Bold="true" Text='<%# Bind("Position") %>'></asp:Label><br />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                       <asp:Label ID="lblDescription" runat="server"  Text='<%# Bind("Description") %>'></asp:Label><br />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='Edit_BoardManager.aspx?ID=<%#Eval("ID") %>'>
                                         <asp:Image ID="imgBtnEdit" runat="server" ImageUrl="../AlbumImages/im_edit.jpg" AlternateText="Edit" />
                                        </a>
                                        <asp:ImageButton ID="imgBtnDel" runat="server" CausesValidation="False" CommandName="Delete"
                                            ImageUrl="../AlbumImages/im_delete.jpg" AlternateText="Delete" OnClientClick = "return confirm('Do you want to delete?')"></asp:ImageButton>
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

