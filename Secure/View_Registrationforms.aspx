<%@ Page Title="Registration forms" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="View_Registrationforms.aspx.cs" Inherits="Secure_View_Registrationforms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" runat="Server">

    <h3>Registrations</h3>
    <fieldset>
        <legend>List below:</legend>
        <table>
            <tr>

                <td align="left" valign="top" style="height: 30px">Search By Post :<br />
                    <asp:DropDownList ID="ddlPost" Width="250px" Height="24px" BackColor="Silver" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPost_SelectedIndexChanged"></asp:DropDownList>
                </td>

                <td align="left" valign="top" style="height: 30px">
                    <br />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete All Records" OnClientClick="return confirm('Do you want to delete?')" OnClick="btnDelete_Click" />
                    <a href="exportExcel.aspx" target="_blank" style="font-size: medium">Export To Excel </a>

                </td>

                <td align="left" valign="top" style="height: 30px">
                    <br />
                    <a href="exportPdf.aspx" target="_blank" style="font-size: medium">Click here for Print </a>
                </td>

            </tr>
        </table>
        <b>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></b>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tbody>
                <tr>
                    <td align="left" valign="top">
                        <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="25" AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowFooter="True" AllowSorting="True" OnRowDeleting="Grid_RowDeleting"
                            OnSorting="gridView_Sorting" OnPageIndexChanging="Grid_PageIndexChanging"
                            CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkBox" runat="Server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="15px" Height="80px" Wrap="True" HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Post Name" HeaderStyle-Width="650px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPostName" runat="server" Font-Size="14px" Text='<%# Bind("PostName") %>'></asp:Label><br />
                                        <asp:Label ID="lblDate" runat="server" ForeColor="Blue" Font-Size="12px" Text='<%# Bind("CreatedDate" ,"{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name" HeaderStyle-Width="650px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Font-Size="14px" Text='<%# Bind("Name") %>'></asp:Label><br />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact" HeaderStyle-Width="650px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobileNo" runat="server" Font-Size="14px" Text='<%# Bind("MobileNo") %>'></asp:Label><br />
                                        <asp:Label ID="lblEmail" runat="server" Font-Size="14px" Text='<%# Bind("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Resume" HeaderStyle-Width="350px">
                                    <ItemTemplate>
                                        <a href='View_Acep_Registrationforms.aspx?ID=<%#Eval("ID") %>'>Read More..
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
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

