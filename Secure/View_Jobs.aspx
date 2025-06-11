<%@ Page Title="View Jobs" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="View_Jobs.aspx.cs" Inherits="Secure_View_Jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<h3>Jobs</h3>
    <fieldset>
        <legend>List below:</legend>
           <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <div id = "dvGrid" style ="width:680px">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                   <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tbody>
            <tr>
            <td>
             <div style="background-color:Bisque; font-size:16px; padding-left:10px">
               <div id="refresh">  <div id="time">   
              <asp:Label ID="lblMessage" runat="server" Width="100%" Visible="false"></asp:Label>
              </div> </div> 
              </div> 
            </td>
            </tr>
                <tr>
                    <td align="left" valign="top">
                        <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="25" AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowFooter="True" AllowSorting="True"
                            OnSorting="gridView_Sorting" OnPageIndexChanging="Grid_PageIndexChanging" 
                            CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None" 
                            onrowcommand="Grid_RowCommand" ondatabound="Grid_DataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="Post">
                                    <ItemTemplate>
                                        <div style="padding-top:10px; padding-bottom:10px">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <div style="padding-top:10px; padding-bottom:10px">
                                        <asp:Label ID="lblMessage" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Publish">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgBtnPublish" runat="server" CommandArgument='<%#Eval("ID")%>' CausesValidation="False" CommandName="Unpublish"
                                            ImageUrl="~/AlbumImages/publish_yes.png" AlternateText="Unpublish"></asp:ImageButton>
                                             <asp:ImageButton ID="imgbtnUnPublish" runat="server" CommandArgument='<%#Eval("ID")%>' 
                                            CausesValidation="False" CommandName="Publish"
                                            ImageUrl="~/AlbumImages/publish_no.png" AlternateText="Publish"></asp:ImageButton>
                                              <asp:HiddenField ID="hdfIsPublished_Grid" runat="server" Value='<%# Bind("IsPublished") %>' />
                                    </ItemTemplate>
                                     <ItemStyle Width="50px" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Edit / Delete">
                                    <ItemTemplate>
                                        <a href='Edit_Jobs.aspx?ID=<%#Eval("ID") %>'>
                                            <asp:Image ID="imgBtnEdit" runat="server" ImageUrl="../AlbumImages/im_edit.jpg" AlternateText="Edit" />
                                        </a>
                                          <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandArgument ='<%# Eval("ID")%>' 
                                            ImageUrl="../AlbumImages/im_delete.jpg"  OnClick = "DeleteDomain" OnClientClick = "return confirm('Do you want to delete?')"></asp:ImageButton><br />
                                    </ItemTemplate>
                                    <ItemStyle Width="100px" HorizontalAlign="Center" />
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
                    </ContentTemplate> 
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID = "Grid" /> 
                        </Triggers> 
                        </asp:UpdatePanel> 
                        </div> 

    </fieldset>
</asp:Content>

