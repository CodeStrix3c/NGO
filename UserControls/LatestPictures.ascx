<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LatestPictures.ascx.cs" Inherits="UserControls_LatestPictures" %>

          <asp:DataList ID="DataList1" runat="Server" Width="450" 
        repeatColumns="1" repeatdirection="Horizontal" borderwidth="0" cellpadding="0" cellspacing="0">
        <ItemStyle cssClass="item" />
        <ItemTemplate>
            <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
           <tr>
            <td style="padding-left:5px">
             <img alt="" src="Upload/<%#(Eval("BytesThumb"))%>" style="width:180px; height:130px"/>
             <hr style="padding-top:5px"/>
           </td>
           <td>
           </td>
           </tr>
            </table>
        </ItemTemplate>
     </asp:DataList>