<%@ Control Language="C#" AutoEventWireup="true" CodeFile="YouCanHelpTwo.ascx.cs" Inherits="UserControls_YouCanHelpTwo" %>


  <asp:DataList ID="lstDiscussionMain" runat="server" DataSourceID="odsDiscussionYou"
        RepeatDirection="Horizontal" RepeatLayout="Flow">
        <ItemTemplate>
                <a href='Help.aspx?Id=<%# Eval("Id") %>&cn=<%# Eval("Title") %>' class="myButton3" >
                <%# Eval("Title") %>
                </a>
        </ItemTemplate>
        </asp:DataList>
            <asp:ObjectDataSource ID="odsDiscussionYou" runat="server" TypeName="iLayer" SelectMethod="GetRightLinksCategory">
    </asp:ObjectDataSource>