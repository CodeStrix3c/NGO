<%@ Control Language="C#" AutoEventWireup="true" CodeFile="News.ascx.cs" Inherits="Control_News" %>

<asp:Repeater ID="rptNews" runat="server">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
               
             <p style="font-size:15px; color:White"><b>
              <%#DataBinder.Eval(Container.DataItem, "Title")%></b>
             </p>
              <%#getLimitedWords(Eval("Description").ToString(),50,230)%>
               <a href='NewsDescription.aspx?ID=<%#Eval("ID") %>'>
               <p style="float:right; color:Red">Read More »</p></a>         
                </ItemTemplate>
                <FooterTemplate>
               
                </FooterTemplate>
                </asp:Repeater>
