<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CompetenciesTwo.ascx.cs" Inherits="UserControls_CompetenciesTwo" %>

 <asp:DataList ID="lstDiscussionMain" runat="server" DataSourceID="odsDiscussionCore"
        RepeatDirection="Horizontal" RepeatLayout="Flow">
        <ItemTemplate>
                <a href='CoreCompetencies.aspx?Id=<%# Eval("Id") %>&cn=<%# Eval("Title") %>' class="myButton3">
                <%# Eval("Title") %></a>
        </ItemTemplate>
        </asp:DataList>
            <asp:ObjectDataSource ID="odsDiscussionCore" runat="server" TypeName="iLayer" SelectMethod="GetCoreCompetencies">
    </asp:ObjectDataSource>