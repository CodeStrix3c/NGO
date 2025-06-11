<%@ Control Language="C#" AutoEventWireup="true" CodeFile="YouCanHelp.ascx.cs" Inherits="UserControls_YouCanHelp" %>

        <a href="Sponsor_A_Child.aspx" class="myButton">Sponsor A Child</a>
        <asp:DataList ID="lstDiscussionMain" runat="server" DataSourceID="odsDiscussionMainOne"
        RepeatDirection="Horizontal" RepeatLayout="Flow">
        <ItemTemplate>
                <a href='Help.aspx?Id=<%# Eval("Id") %>&cn=<%# Eval("Title") %>' class="myButton" style="padding-bottom:5px">
                <%# Eval("Title") %></a><br />
        </ItemTemplate>
        </asp:DataList>
            <asp:ObjectDataSource ID="odsDiscussionMainOne" runat="server" TypeName="iLayer" SelectMethod="GetRightLinksCategory">
    </asp:ObjectDataSource>
        <a href="Annual_Reports.aspx" class="myButton">Annual Reports </a>
        <a href="Downloads.aspx" class="myButton">Downloads</a>
        <a href="Issue.aspx" class="myButton">News Letter</a>