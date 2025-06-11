<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="View_New_Registrationforms.aspx.cs" Inherits="Secure_View_New_Registrationforms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
  <h3>New Registrations</h3>
    <fieldset>
        <legend>List below:</legend>
      <%--  <table>
              <tr>

                    <td align="left" valign="top"  style="height: 30px"> 
                     Search By Post :<br />
                     <asp:DropDownList ID="ddlPost"  Width="250px" Height="24px" BackColor="Silver" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPost_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td align="left" valign="top"  style="height: 30px"> 
                    Search By Post Code :<br />
                     <asp:DropDownList ID="ddlPostalCode"  Width="250px" Height="24px" BackColor="Silver" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPostalCode_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                </tr>
        </table>--%>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tbody>
                <tr>
                    <td align="left" valign="top">
                        <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="25" AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowFooter="True" AllowSorting="True" OnRowDeleting="Grid_RowDeleting"
                            OnSorting="gridView_Sorting" OnPageIndexChanging="Grid_PageIndexChanging" 
                            CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None" OnRowCommand="Grid_RowCommand" >
                            <Columns>
                                 <asp:TemplateField HeaderText="Photo">
                                    <ItemTemplate>
                                     <img alt="" src="../Upload/<%#(Eval("FileUrl"))%>" style="width:200px; padding-right:10px"/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                              <asp:TemplateField HeaderText="Post Name" HeaderStyle-Width="650px">
                                    <ItemTemplate>
                                      <img alt="" src="../Upload/<%#(Eval("SigUrl"))%>" style="width:200px; padding-right:10px"/> <br />
                                      <b> Name :- </b> <asp:Label ID="lblName" runat="server" Font-Size="14px" Text='<%# Bind("Name") %>'></asp:Label><br />
                                      <b>  Post Name:- </b> <asp:Label ID="lblPostName" runat="server" Font-Size="14px" Text='<%# Bind("PostName") %>'></asp:Label><br />
                                      <b>Mobile No.:- </b>   <asp:Label ID="lblMobileNo" runat="server" Font-Size="14px" Text='<%# Bind("MobileNo") %>'></asp:Label><br />
                                      <b>Email :- </b>    <asp:Label ID="lblEmail" runat="server" Font-Size="14px" Text='<%# Bind("Email") %>'></asp:Label><br />
                                      <b> Date :-  </b> <asp:Label ID="lblDate" runat="server" ForeColor="Blue" Font-Size="12px" Text='<%# Bind("CreatedDate" ,"{0:D}") %>'></asp:Label><br />
                                     <b> Job Location :-  </b> <asp:Label ID="Label1" runat="server" Font-Size="14px" Text='<%# Bind("PreferenceDistOne") %>'></asp:Label>,
                                         <asp:Label ID="Label2" runat="server" Font-Size="14px" Text='<%# Bind("PreferenceDistTwo") %>'></asp:Label>,
                                         <asp:Label ID="Label3" runat="server" Font-Size="14px" Text='<%# Bind("PreferenceDistThree") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                             
                                 
                                  <asp:TemplateField HeaderText="Details" HeaderStyle-Width="350px">
                                    <ItemTemplate>
                                        <a href='View_Acep_Registrationforms.aspx?ID=<%#Eval("ID") %>'>
                                        Read More..
                                       <%--  <asp:ImageButton ID="imgBtnPublish" runat="server" CommandArgument='<%#Eval("ID")%>' CausesValidation="False" CommandName="Unpublish"
                                            ImageUrl="~/AlbumImages/publish_yes.png" AlternateText="Unpublish"></asp:ImageButton>--%>
                                       </a>
                                    <%--  <asp:HiddenField ID="hdfIsPublished_Grid" runat="server" Value='<%# Bind("IsActive") %>' />--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
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

