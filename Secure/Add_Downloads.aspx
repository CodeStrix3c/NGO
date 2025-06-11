<%@ Page Title="Add Downloads" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Add_Downloads.aspx.cs" Inherits="Secure_Add_Downloads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<h3>Add Downloads</h3>

    <fieldset>
        <legend>Enter details below:</legend>
        <table cellpadding="3" cellspacing="3" border="0">
            <tbody>
                  <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                        Category:
                    </td>
                    <td align="left" valign="top">

                        <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                         <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator8" ControlToValidate="ddlCategory" ErrorMessage="Category is required" InitialValue="0" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                        Title:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtName" runat="Server" Width="300px" Height="22px"></asp:TextBox>
                       <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="txtName" ErrorMessage="Title is required" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                   <tr>
                                      <td align="right" valign="top" style="font-weight: bold">
                                        Choose Photo :
                                      </td>
                                      <td align="left" valign="top">
                                        <asp:FileUpload ID="Ofile" runat="server" Width="300px"  onchange="javascript:chkOfile();"/>
                                       </td>
                                       </tr>
                   <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                        File:
                    </td>
                    <td align="left" valign="top">
                        <asp:FileUpload ID="Addfile" runat="server" Width="300px"/>
                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" ControlToValidate="Addfile" ErrorMessage="Upload file" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="RequiredFieldValidator" 
                            runat="server" Text="Uplaod PDF file"  ErrorMessage="Uplaod PDF  file!" ToolTip="Uplaod PDF file!"
                            ValidationExpression="^.*\.(pdf|PDF)$"
                            ControlToValidate="Addfile" Display="Dynamic" ValidationGroup="Writer"
                            Width="277px"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                    </td>
                   <td align="right" valign="top">
                        <asp:ImageButton ID="btnSave" runat="server" ImageUrl="../AlbumImages/button-save.gif"
                            AlternateText="Save" ValidationGroup="Writer" OnClientClick="return News()"
                            onclick="btnSave_Click"  />
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>

    <h3>Downloads List</h3>
    <fieldset>
        <legend>List below:</legend>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tbody>
                <tr>
                    <td align="left" valign="top">
                        <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="25" AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowFooter="True" AllowSorting="True" OnRowDeleting="Grid_RowDeleting"
                            OnSorting="gridView_Sorting" OnPageIndexChanging="Grid_PageIndexChanging" 
                            CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None" >
                            <Columns>
                                <asp:TemplateField HeaderText="Title" HeaderStyle-Width="650px">
                                    <ItemTemplate>
                                       <a href='<%# FileURL( Eval("Url") )%>'  target="_blank">
                                       <asp:Label ID="lblWriterName" runat="server" Font-Size="14px" Text='<%# Bind("Title") %>'></asp:Label>
                                       </a> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Images" HeaderStyle-Width="350px">
                                    <ItemTemplate>
                                       <a href='<%# FileURL( Eval("Url") )%>'  target="_blank">
                                       <img alt="" src="../Upload/<%#(Eval("ImageUrl"))%>" />
                                       </a>
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

