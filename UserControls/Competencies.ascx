<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Competencies.ascx.cs" Inherits="UserControls_Competencies" %>


 <asp:DataList ID="lstDiscussionMain" runat="server" DataSourceID="odsDiscussionMainTwo"
        RepeatDirection="Horizontal" RepeatLayout="Flow">
        <ItemTemplate>
                <a href='CoreCompetencies.aspx?Id=<%# Eval("Id") %>&cn=<%# Eval("Title") %>' class="myButton">
                <%# Eval("Title") %></a>
               
        </ItemTemplate>
        </asp:DataList>
            <asp:ObjectDataSource ID="odsDiscussionMainTwo" runat="server" TypeName="iLayer" SelectMethod="GetCoreCompetencies">
    </asp:ObjectDataSource>