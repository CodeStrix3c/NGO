<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="viewOnlineRegistration.aspx.cs" Inherits="Secure_viewOnlineRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
     <script type = "text/javascript">
         function PrintPanel() {
             var panel = document.getElementById("<%=pnlContents.ClientID %>");
         var printWindow = window.open('', '', 'height=400,width=800');
         printWindow.document.write('<html><head><title>Registration Details</title>');
         printWindow.document.write('</head><body >');
         printWindow.document.write(panel.innerHTML);
         printWindow.document.write('</body></html>');
         printWindow.document.close();
         setTimeout(function () {
             printWindow.print();
         }, 500);
         return false;
     }
    </script>

     <h3>Registration Deatils</h3>
    <fieldset>
        <legend>List below:</legend>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tbody>
                <tr>
                    <td align="left" valign="top">
                        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick = "return PrintPanel();" />
                          <asp:Panel id="pnlContents" runat = "server">
                        <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="25" AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowFooter="True" AllowSorting="True" OnRowDeleting="Grid_RowDeleting"
                            OnPageIndexChanging="Grid_PageIndexChanging" CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None">
                            <Columns>

                                <asp:TemplateField HeaderText="Registration Deatils">

                                    <ItemStyle VerticalAlign="Top" />
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
                                            <tr>
                                                <td style="padding-top: 10px; padding-bottom: 10px">
                                                    <asp:Label ID="Label1" Font-Bold="true" ForeColor="Red" runat="server" Text="Personal Details"></asp:Label><br />
                                                    <b>Full Name : </b>
                                                    <asp:Label ID="lblWriterName" runat="server" Text='<%# Bind("firstName") %>'></asp:Label> 
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("middleName") %>'></asp:Label>
                                                    <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Surname") %>'></asp:Label><br />
                                                    <hr style="width: 350px" />
                                                    <b>Gender : </b>
                                                    <asp:Label ID="lblMessage" runat="server" Text='<%# Bind("Gender") %>'></asp:Label><br />
                                                    <hr style="width: 350px" />
                                                    <b>Marital Status : </b>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MaritalStatus") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />
                                                    <b>DOB : </b>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DOB") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />
                                                    <asp:Label ID="Label16" Font-Bold="true" runat="server" Text="Parent's Details"></asp:Label><br />
                                                    <b>Father Name : </b>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("pfirstName") %>'></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("pmiddleName") %>'></asp:Label>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("pSurname") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                     <asp:Label ID="Label17" Font-Bold="true" runat="server" Text="Address"></asp:Label><br />
                                                    <b>H. No/Street Name : </b>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("jform_Street_Name") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />
                                                   
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Photo">
                                    <ItemTemplate>
                                         <img alt="" src="../Upload/<%#(Eval("Photograph"))%>" style="width:150px; padding-right:10px" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='RegistrationDetails.aspx?Id=<%#Eval("Id") %>' target="_blank">View Details</a><br /><br />
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
                              </asp:Panel> 
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>
</asp:Content>

