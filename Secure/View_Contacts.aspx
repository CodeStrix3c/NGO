<%@ Page Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="View_Contacts.aspx.cs" Inherits="FazilKashmir_Ad_View_Contacts" Title="View Contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
  <h3>
        Contact List</h3>
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
                                <asp:TemplateField HeaderText="Contact Information">
                                    <ItemStyle VerticalAlign="Top" />
                                    <ItemTemplate>
                                    <div style="padding-left:10px">
                                    <table>

                                    <tr>
                                    <td><b style="font-weight:bold">Name : </b>  </td>
                                    <td >
                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("Name") %>'></asp:Label> <br />
                                    </td> 
                                    </tr>

                                    <tr>
                                     <td>  </td>
                                    <td >
                                     <b style="font-weight:bold">Contact Details : </b> <br />
                                     <asp:Label ID="Label5" runat="server" Text='<%# Bind("Address") %>'></asp:Label> <br />
                                    </td> 
                                    </tr>

                              <%--      <tr>
                                     <td><b style="font-weight:bold">Phone No : </b> </td>
                                    <td >
                                     <asp:Label ID="Label7" runat="server" Text='<%# Bind("Phone") %>'></asp:Label> <br />
                                    </td> 
                                    </tr>

                                    <tr>
                                     <td><b style="font-weight:bold">Mobile No : </b></td>
                                    <td >
                                     <asp:Label ID="Label6" runat="server" Text='<%# Bind("MobileNo") %>'></asp:Label> <br />
                                    </td> 
                                    </tr>

                                    <tr>
                                     <td><b style="font-weight:bold">Email : </b> </td>
                                    <td >
                                     <asp:Label ID="Label4" runat="server" Text='<%# Bind("Email") %>'></asp:Label> <br />
                                    </td> 
                                    </tr>

                                    <tr>
                                     <td><b style="font-weight:bold">Fax : </b></td>
                                    <td >
                                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("FaxNo") %>'></asp:Label> <br />
                                    </td> 
                                    </tr>--%>

                                    <hr style="width:600px" />
                                    <hr style="width:600px" />
                                    </table>
                                      </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='Edit_Contact.aspx?ID=<%#Eval("ID") %>'>
                                            <asp:Image ID="imgBtnEdit" runat="server" ImageUrl="../AlbumImages/im_edit.jpg" AlternateText="Edit" />
                                        </a>
                                        <asp:ImageButton ID="imgBtnDel" runat="server" CausesValidation="False" CommandName="Delete"
                                            ImageUrl="../AlbumImages/im_delete.jpg" AlternateText="Delete"></asp:ImageButton>
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

