<%@ Page Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="View_Events.aspx.cs" Inherits="FazilKashmir_Ad_View_Events" Title="View Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<h3>Events</h3>
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
                               
                                <asp:TemplateField>
                                    <ItemTemplate>
                                     <div style="padding-top:5px; padding-left:10px">
                                     <b style="font-size:13px">Title</b><br />
                                     <asp:Label ID="lblTitle" runat="server" Font-Bold="true" ForeColor="Blue" Text='<%# Bind("Title") %>'></asp:Label><br /><br />
                                     <b style="font-size:13px">Description</b><br />
                                     <img alt="" src="../Upload/<%#(Eval("ImageUrl"))%>" style="float:left; padding-right:10px"/>
                                     <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label><br />
                                     <b style="font-size:13px">Place :</b>
                                     <asp:Label ID="lblPlace" runat="server" Text='<%# Bind("Place") %>'></asp:Label><br />
                                     <b style="font-size:13px">Event Date :</b>
                                     <asp:Label ID="lblDate" runat="server" Text='<%# Bind("EventDate")%>'></asp:Label>
                                     </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                             
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='Edit_Events.aspx?ID=<%#Eval("ID") %>'>
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

