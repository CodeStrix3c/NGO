<%@ Page Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="View_Videos.aspx.cs" Inherits="FazilKashmir_Ad_Default2" Title="View Videos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<h3>Videos List</h3>
    <fieldset>
        <legend>List below:</legend>

        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tbody>
            <tr>
            <td style="padding-bottom:5px">
                     Subject:
                        <asp:DropDownList ID="ddlSpeakers" runat="server" Height="20px" 
                    Width="300px" AutoPostBack="True" 
                    onselectedindexchanged="ddlSpeakers_SelectedIndexChanged">
                        </asp:DropDownList>
             </td>
            </tr>
                <tr>
                    <td align="left" valign="top">
                        <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="25" AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowFooter="True" AllowSorting="True" OnRowDeleting="Grid_RowDeleting"
                            OnSorting="gridView_Sorting" OnPageIndexChanging="Grid_PageIndexChanging" CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None">
                            <Columns>
                             
                                <asp:TemplateField HeaderText="Video">
                                    <ItemStyle VerticalAlign="Top" />
                                    <ItemTemplate>
                                     <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
                                      <tr>
                                         <td style="padding-right:10px; padding-bottom:10px; padding-top:10px">
                                           <a href='PlayVideo.aspx?ID=<%#Eval("ID") %>'>
                                           <img alt="" src="../images/AudioPlayer.gif"/></a><br />
                                           </a>
                                        </td>
                                        <td>
                                         <b>Subject</b><br />
                                          <asp:Label ID="Label1" runat="server" Font-Size="14px" Text='<%# Bind("Subject") %>'></asp:Label><br />
                                         <b>Speaker Name</b><br />
                                          <asp:Label ID="lblSName" runat="server" Font-Size="14px" Text='<%# Bind("SName") %>'></asp:Label><br />
                                             <b>Video Url</b><br />
                                           <asp:Label ID="lblVName" runat="server" Font-Size="14px" Text='<%# Bind("VideoName") %>'></asp:Label>
                                        </td>
                                        <hr />
                                     </tr>
                                    </table>
                                   <table>
                                  <tr>
                                  <td>
                                    <b>Title</b><br />
                                           <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("Title") %>'></asp:Label> <br />
                                           <b>Description</b><br />
                                           <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label><br />
                                  </td>
                                  </tr>
                                   </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='Edit_Video.aspx?ID=<%#Eval("ID") %>'>
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

