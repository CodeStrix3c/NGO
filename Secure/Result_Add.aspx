<%@ Page Title="Add Results" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Result_Add.aspx.cs" Inherits="Secure_Result_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
    <h3>Add Details</h3>

    <fieldset>
        <legend>Enter details below:</legend>
        <table cellpadding="3" cellspacing="3" border="0">
            <tbody>
               
                <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                        Roll No:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtName" runat="Server" Width="300px" Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="txtName" ErrorMessage="required" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtName" Text="Please enter a number" EnableClientScript="true" ValidationExpression="^\d+(\.\d{2})?$" ValidationGroup="Writer"></asp:RegularExpressionValidator>

                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">
                    </td>
                   <td align="right" valign="top">
                        <asp:ImageButton ID="btnSave" runat="server" ImageUrl="../AlbumImages/button-save.gif"
                            AlternateText="Save" ValidationGroup="Writer"
                            onclick="btnSave_Click"  />
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>

    <h3>List</h3>
    <fieldset>
        <legend>List below:</legend>
        
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
                                    <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="200" AutoGenerateColumns="False"
                                        DataKeyNames="ID" ShowFooter="True" AllowSorting="True" OnRowDeleting="Grid_RowDeleting"
                                        OnSorting="gridView_Sorting" OnPageIndexChanging="Grid_PageIndexChanging" 
                                        CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None"  onrowcommand="Grid_RowCommand" ondatabound="Grid_DataBound">

                                        <Columns>
                                            <asp:TemplateField HeaderText="Roll Numbers">
                                                <ItemTemplate>
                                                   <asp:Label ID="lblWriterName" runat="server" Font-Size="14px" Text='<%# Bind("Title") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                              <asp:TemplateField HeaderText="Publish">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgBtnPublish" runat="server" CommandArgument='<%#Eval("Id")%>' CausesValidation="False" CommandName="Unpublish"
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
                                                  <%--  <a href='Edit_AudioCategory.aspx?ID=<%#Eval("ID") %>'>
                                                        <asp:Image ID="imgBtnEdit" runat="server" ImageUrl="../AlbumImages/im_edit.jpg" AlternateText="Edit" />
                                                    </a>--%>
                                                    <asp:ImageButton ID="imgBtnDel" runat="server" CausesValidation="False" CommandName="Delete"
                                                        ImageUrl="../AlbumImages/im_delete.jpg" AlternateText="Delete"  OnClientClick = "return confirm('Do you want to delete?')"></asp:ImageButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="50px" HorizontalAlign="Center" />
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

