<%@ Page Title="Donation Details" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Donation_view.aspx.cs" Inherits="Secure_Donation_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" runat="Server">
    <h3>Donation Deatils</h3>
    <fieldset>
        <legend>List below:</legend>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tbody>
                <tr>
                    <td align="left" valign="top">
                        <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="25" AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowFooter="True" AllowSorting="True" OnRowDeleting="Grid_RowDeleting"
                            OnPageIndexChanging="Grid_PageIndexChanging" CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="Donation Deatils">
                                    <ItemStyle VerticalAlign="Top" />
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
                                            <tr>
                                                <td style="padding-top: 10px; padding-bottom: 10px">
                                                    <asp:Label ID="Label1" Font-Bold="true" runat="server" Text='<%# Bind("dorderdate","{0:D}") %>'></asp:Label><br />
                                                    <b>Order No : </b>
                                                    <asp:Label ID="lblWriterName" runat="server" Text='<%# Bind("dorderid") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />
                                                    <b>Ref. No : </b>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("dccavenuerefno") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />
                                                    <b>Tracking Id : </b>
                                                    <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("dtrackingid") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />
                                                    <b>Bank Ref. No : </b>
                                                    <asp:Label ID="lblMessage" runat="server" Text='<%# Bind("dbankrefno") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />
                                                    <b>Ref. No : </b>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("dccavenuerefno") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>Name : </b>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("dfullname") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>Email : </b>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("demailid") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>Address : </b>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("daddress") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>City : </b>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("dcity") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>State : </b>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("dstate") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>Zip : </b>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("dzip") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>Pan No : </b>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("dpanno") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>Amount : </b>
                                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("damount") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>Nationality : </b>
                                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("dnationality") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>Paymode : </b>
                                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("dpaymode") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>Bank Name : </b>
                                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("dcardname") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                      <b>Donor Type : </b>
                                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("DonorType") %>'></asp:Label><br />
                                                    <hr style="width: 450px" />

                                                    <b>Purpose : </b>
                                                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("Purpose") %>'></asp:Label> |
                                                     <asp:Label ID="Label17" runat="server" Text='<%# Bind("PurposeType") %>'></asp:Label><br />
                                                    <br />
                                                    <hr style="width: 450px" />


                                                </td>
                                            </tr>
                                            <hr />
                                            <hr />
                                        </table>
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

