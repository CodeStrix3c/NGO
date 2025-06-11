<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Events.ascx.cs" Inherits="Control_Events" %>

<asp:Repeater ID="rptEvents" runat="server">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
               
             <p style="font-size:15px; color:White"><b>
              <%#DataBinder.Eval(Container.DataItem, "Title")%></b>
             </p>
              <%#getLimitedWords(Eval("Description").ToString(),40,230)%>
              <a href='EventDescription.aspx?ID=<%#Eval("ID") %>'>
               <p style="float:right; color:Red">Read More »</p></a>   
                </ItemTemplate>
                <FooterTemplate>
               
                </FooterTemplate>
                </asp:Repeater>
