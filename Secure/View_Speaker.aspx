<%@ Page Title="View Speakers" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="View_Speaker.aspx.cs" Inherits="FazilKashmir_Ad_View_Speaker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<h3>Speakers</h3>
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
                                    <ItemStyle VerticalAlign="Top" />
                                    <ItemTemplate>
                                     <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
                                      <tr>
                                         <td style="padding-right:10px">
                                         <img alt="" src="<%# getPhotos(Eval("Photo"))%>"/>
                                        </td>
                                         <td>
                                          <b>Name : </b> 
                                          <asp:Label ID="lblWriterName" runat="server" Text='<%# Bind("SName") %>'></asp:Label><br />
                                          <hr style="width:450px"/>
                                          <b>Address : </b>
                                          <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Address") %>'></asp:Label><br />
                                           <hr style="width:450px"/>
                                          <b>Contact No : </b>
                                         <asp:Label ID="lblMessage" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label><br />
                                         <hr style="width:450px"/>
                                        </td>
                                     </tr>
                                     <hr /><hr />
                                    </table>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='Edit_Speaker.aspx?ID=<%#Eval("ID") %>'>
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

