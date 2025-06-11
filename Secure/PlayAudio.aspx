<%@ Page Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="PlayAudio.aspx.cs" Inherits="FazilKashmir_Ad_PlayAudio" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<table>
 <tr>
 <td>
 <div>
  <asp:Repeater ID="rptAudio" runat="server">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
               
                <OBJECT id='mediaPlayer1' width="380" height="200" 
                classid='CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95' 
                codebase='http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701'
                standby='Loading Microsoft Windows Media Player components...' type='application/x-oleobject'>
                <param name='fileName' value="../Audios/<%#(Eval("AudioName"))%>">
               <param name='animationatStart' value='true'>
               <param name='transparentatStart' value='true'>
               <param name='autoStart' value="false">
               <param name='showControls' value="true">
               <param name ="ShowAudioControls"value="true"> 
               <param name="ShowStatusBar" value="true">
               <param name='loop' value="false">
               <EMBED type='application/x-mplayer2'
               pluginspage='http://microsoft.com/windows/mediaplayer/en/download/'
               id='mediaPlayer' name='mediaPlayer' displaysize='4' autosize='-1' 
               bgcolor='darkblue' showcontrols="true" showtracker='-1' 
               showdisplay='0' showstatusbar='-1' videoborder3d='-1' width="380" height="200"
               src="../Audios/<%#(Eval("AudioName"))%>" autostart="true" designtimesp='5311' loop="false">
                </EMBED>
               </OBJECT>
                  
                </ItemTemplate>
                <FooterTemplate>
               
                </FooterTemplate>
                </asp:Repeater>
 </div> 
</td>
</tr> 
</table> 
</asp:Content>

