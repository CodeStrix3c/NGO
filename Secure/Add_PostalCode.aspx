<%@ Page Title="Code" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Add_PostalCode.aspx.cs" Inherits="Secure_Add_PostalCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
    <h3>
        Postal codes</h3>
    <table width="100%">
        <tr>
            <td align="left" valign="top">
                <table>
                    <tr>
                        <td align="left" valign="top" style="width: 395px">
                            <fieldset>
                                <legend>Enter details below:</legend>
                                <p>
                                </p>
                                        <table>
                                            <tr>
                                        <td align="right" style="font-weight: bold" valign="top">
                                            Name</td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox>
                                                                                       
                                         </td>
                                       </tr>
                                       
                                        <tr>
                                        <td align="right" style="font-weight: bold" valign="top">
                                            Code</td>
                                        <td align="left" valign="top">
                                              <asp:TextBox ID="txtDescription" runat="server" Width="300px"></asp:TextBox>
                                         </td>
                                    </tr>
                                        </table>
                                        <p style="text-align: right;">
                                            <asp:ImageButton ID="btnSave" runat="server" CommandName="Insert" ImageUrl="../AlbumImages/button-save.gif"
                                              OnClientClick="return News()"    onclick="btnSave_Click"  />
                                        </p>
                                   
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
            
        </tr>
    </table>
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
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <div style="padding-top:10px; padding-bottom:10px">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Code">
                                    <ItemTemplate>
                                        <div style="padding-top:10px; padding-bottom:10px">
                                        <asp:Label ID="lblMessage" runat="server" Text='<%# Bind("PCode") %>'></asp:Label>
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
                                  <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                 <%--       <a href='Edit_Jobs.aspx?ID=<%#Eval("ID") %>'>
                                            <asp:Image ID="imgBtnEdit" runat="server" ImageUrl="../AlbumImages/im_edit.jpg" AlternateText="Edit" />
                                        </a>--%>
                                          <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandArgument ='<%# Eval("ID")%>' 
                                            ImageUrl="../AlbumImages/im_delete.jpg"  OnClick = "DeleteDomain" OnClientClick = "return confirm('Do you want to delete?')"></asp:ImageButton><br />
                                    </ItemTemplate>
                                      <HeaderStyle HorizontalAlign="Center" />
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

