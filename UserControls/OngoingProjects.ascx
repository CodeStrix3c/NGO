<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OngoingProjects.ascx.cs" Inherits="UserControls_OngoingProjects" %>


<asp:Literal ID="ltrProjects" runat="server"></asp:Literal>

  <%--<asp:DataList ID="DataList1" runat="Server"
                            repeatColumns="10" repeatdirection="Horizontal" borderwidth="0" cellpadding="0" cellspacing="0">
                            <ItemStyle cssClass="item" />
                            <ItemTemplate>
                                <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
                                <tr>
                                <td>
                                <div class="pic fl">
                                <a href='ProjectDescription.aspx?Id=<%# Eval("Id") %>&cn=<%# Eval("Title") %>'>
                                <img style="width:190px; height:180px" alt="" src="Upload/<%#(Eval("ImageUrl"))%>"  /><br />
                                <asp:Label ID="lblWriterName" Font-Bold="true" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                </a> 
                                </div> 
                                </td>
                                </tr>
                                </table>
                            </ItemTemplate>
                            </asp:DataList>--%>