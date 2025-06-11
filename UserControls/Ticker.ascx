<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Ticker.ascx.cs" Inherits="UserControls_Ticker" %>

  <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                                <ItemTemplate>
                                  <asp:Label ID="Label1" Font-Bold="true" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:DataList>
                          