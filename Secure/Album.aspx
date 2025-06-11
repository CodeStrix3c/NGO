<%@ Page Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Album.aspx.cs" Inherits="FazilKashmir_Ad_Default2" Title="Add Albums" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
 <h3>
        Albums</h3>
    <table width="100%">
        <tr>
            <td align="left" valign="top">
                <table>
                    <tr>
                        <td align="left" valign="top">
                            <fieldset>
                                <legend>Add New Albums</legend>
                                <p>
                                </p>
                                <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" BorderWidth="0"
                                    CellPadding="0" OnItemInserting="FormView1_ItemInserting">
                                    <InsertItemTemplate>
                                        <table>
                                            <tr>
                                                <td align="left" valign="top">
                                                     Album:
                                                </td>
                                                <td align="left" valign="top">
                                                    <asp:TextBox ID="txtCaption" runat="server" CssClass="textfield"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ID="rfv" ControlToValidate="txtCaption"
                                                        ErrorMessage="Title is required" Display="Dynamic" ValidationGroup="AddAlbums"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                    Publish:
                                                 </td>
                                                <td align="left" valign="top">
                                                    <asp:CheckBox ID="chkIsPublic" runat="server" Checked="true" />
                                                </td>
                                            </tr>
                                        </table>
                                        <p style="text-align: right;">
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Insert" ImageUrl="../AlbumImages/button-save.gif"
                                                ValidationGroup="AddAlbums" OnClientClick="return Albums()" />
                                        </p>
                                    </InsertItemTemplate>
                                </asp:FormView>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
            <td align="left" valign="top" width="400px">
                <table width="100%">
                    <tr>
                        <td align="left" valign="top">
                            <fieldset>
                                <legend>Your Albums</legend>
                                <asp:GridView ID="GridView1" runat="server" DataKeyNames="AlbumID" CellPadding="4"
                                    AutoGenerateColumns="False" ShowHeader="False" Width="100%"
                                    OnPageIndexChanging="GridView1_PageIndexChanged" OnRowDeleting="GridView1_RowDeleting"
                                    OnRowCommand="GridView1_RowCommand" PageSize="5" AllowPaging="True" ForeColor="#333333" GridLines="None">
                                    <EmptyDataTemplate>
                                        Currently You have no albums.
                                    </EmptyDataTemplate>
                                    <EmptyDataRowStyle CssClass="emptydata"></EmptyDataRowStyle>
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemStyle Width="116px" />
                                            <ItemTemplate>
                                                <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
                                                    <tr>
                                                        <td class="topx--">
                                                        </td>
                                                        <td class="top-x-">
                                                        </td>
                                                        <td class="top--x">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="midx--">
                                                        </td>
                                                        <td style="padding-left:3px">
                                                        <asp:Label ID="lblCaption" runat="server" Font-Bold="true"  Text='<%# Bind("Caption") %>'  ></asp:Label><br />
                                                            <a href='Photos.aspx?AlbumID=<%# Eval("AlbumID") %>'>
                                                                <img src="../Control/ShowImage.aspx?AlbumID=<%# Eval("AlbumID") %>&Size=S" class="photo_198"
                                                                    style="border: 4px solid white" alt="Sample Photo from Album Number <%# Eval("AlbumID") %>" /></a></td>
                                                        <td class="mid--x">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="botx--">
                                                        </td>
                                                        <td class="bot-x-">
                                                        </td>
                                                        <td class="bot--x">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <%-- <asp:TemplateField>
                                            <ItemTemplate>
                                                <table cellpadding="2" cellspacing="2" border="0">
                                                    <tr>
                                                        <td align="left" valign="top">
                                                             <asp:Label ID="lblCaption" runat="server"  Text='<%# Bind("Caption") %>'  ></asp:Label>
                                                        </td>
                                                       <td align="center" valign="top">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div style="width: 100%; text-align: right;">
                                                    <a href='<%# "Photos.aspx?AlbumID=" + Eval("AlbumID") %>'>
                                                        <asp:Image ID="imgbtnNew" runat="Server" ImageUrl="../AlbumImages/button-add.gif" /></a>
                                                    <asp:ImageButton ID="imgbtnDelete" runat="server" CommandName="Delete" ImageUrl="../AlbumImages/button-delete.gif" OnClientClick = "return confirm('Do you want to delete?')" />
                                                </div>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div style="padding: 8px 0;">
                                                    <asp:TextBox ID="TextBox2" runat="server" Width="160" Text='<%# Bind("Caption") %>'
                                                        CssClass="textfield" />
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsPublic") %>' Text="Public" />
                                                </div>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

