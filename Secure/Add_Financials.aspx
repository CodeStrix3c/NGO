<%@ Page Title="Add Financials" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Add_Financials.aspx.cs" Inherits="Secure_Add_Financials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
    <h3>
       Financials Details</h3>
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
                                            Title</td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtTitle" ErrorMessage="title is required" Display="Dynamic" ValidationGroup="KidsPage"></asp:RequiredFieldValidator>                                      
                                         </td>
                                       </tr>
                                       <tr>
                                      <td align="right" valign="top" style="font-weight: bold">
                                        Foreign Funds :
                                      </td>
                                      <td align="left" valign="top">
                                        <asp:FileUpload ID="Ofile" runat="server" Width="300px"/>
                                       </td>
                                       </tr>

                                       <tr>
                                      <td align="right" valign="top" style="font-weight: bold">
                                        Domestic Funds :
                                      </td>
                                       <td align="left" valign="top">
                                        <asp:FileUpload ID="upLoadLargeImage" runat="server" Width="300px"/>
                                       </td>
                                       </tr>
                                      
                                        </table>
                                        <p style="text-align: right;">
                                            <asp:ImageButton ID="btnSave" runat="server" CommandName="Insert" ImageUrl="../AlbumImages/button-save.gif"
                                                  onclick="btnSave_Click" ValidationGroup="KidsPage" />
                                        </p>
                                   
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
            
        </tr>
    </table>

    <h3>Details</h3>
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

                                <asp:TemplateField HeaderText="Title">
                                    <ItemTemplate>
                                       <asp:Label ID="lblWriterName" runat="server" Font-Bold="true" ForeColor="Blue" Text='<%# Bind("Title") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Foreign Funds">
                                    <ItemTemplate>
                                       <a href='<%# FileURL( Eval("ForeignFunds") )%>'  target="_blank">
                                       Foreign Funds
                                       </a> 
                                    </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Domestic Funds">
                                    <ItemTemplate>
                                         <a href='<%# FileURL( Eval("DomesticFunds") )%>'  target="_blank">
                                         Domestic Funds
                                         </a> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                              
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
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

