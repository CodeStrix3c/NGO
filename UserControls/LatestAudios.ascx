<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LatestAudios.ascx.cs" Inherits="UserControls_LatestAudios" %>

              <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="10" AutoGenerateColumns="False"
                                 DataKeyNames="ID" ShowFooter="True" AllowSorting="True" 
                                    CellPadding="4" Width="100%" 
                                    ForeColor="#333333" GridLines="None">
                             <Columns>
                                <asp:TemplateField  SortExpression="Title">
                                    <ItemStyle VerticalAlign="Top" />
                                    <ItemTemplate>
                                     <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
                                     <tr>
                                     <td style="text-align:justify; padding-bottom:10px">
                                       <asp:Label ID="Label1" ForeColor="Black" runat="server" Text='<%# Bind("Title") %>'></asp:Label><br />
                                      <object type="application/x-shockwave-flash" data="http://flash-mp3-player.net/medias/player_mp3_maxi.swf" width="175" height="20">
                                                    <param name="movie" value="http://flash-mp3-player.net/medias/player_mp3_maxi.swf" />
                                                    <param name="bgcolor" value="#ffffff" />
                                                    <param name="FlashVars" value="mp3=Audios/<%#(Eval("AudioName"))%>" />
                                       </object>
                                     
                                       <br />
                                       <hr style="width:155px" />  
                                     </td>
                                     </tr>
                                    </table>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                               
                            </Columns>
                        </asp:GridView>