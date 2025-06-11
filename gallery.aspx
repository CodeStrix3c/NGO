<%@ Page Title="Gallery" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div id="content-row">
        <div class="row-container visible visible-first">
          <div class="container">
            <div class="content-inner row">   
                      
              <div id="component" class="span12">
                <main role="main">
                         
                          
                  <div class="gallery">
                    <h3 class="visible-first visible">
                        <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">Gallery</span> 
                         </h3>  
                   <div class="jg_pathway">
                   </div>
                  <div class="jg_subcat">
                    <div class="jg_row jg_row2">


                          <table border="0" cellpadding="0" cellspacing="0" >
                    <tr>
                        <td valign="top">
                            <asp:Literal ID="ltrimgs" runat="server"></asp:Literal>
                        <%--<asp:DataList ID="DataList1" runat="Server" 
                        repeatColumns="3" repeatdirection="Horizontal" borderwidth="0" cellpadding="0" cellspacing="0">
                        <ItemStyle cssClass="item" />
                        <ItemTemplate>

                            <div class="jg_subcatelem_cat">
                                <div class="jg_imgalign_catsubs">
                                  <div class="jg_subcatelem_photo">
                                    <a href='Photos.aspx?Id=<%# Eval("AlbumID") %>&cn=<%# Eval("Caption") %>'>
                                      <span class="lazy lazy_container lazyloaded" style="width: 347px;"><span class="lazy lazy_preloader" style="padding-top: 80.691642651297%;"></span>
                                          <img src="Upload/<%#(Eval("BytesThumb"))%>" hspace="4" vspace="0" class="lazy jg_photo" alt="First Category" style="display: block;">
                                      </span>
                                    </a>
                                  </div>
                                <div class="jg_subcatelem_txt">
                                  <a class="jg_subcatelem_txt__link" href='Photos.aspx?Id=<%# Eval("AlbumID") %>&cn=<%# Eval("Caption") %>'></a>
                                  <ul>
                                    <li class="lastItem firstItem">
                                     <%# Eval("Count") %> Photo(s)
                                      <%# Server.HtmlEncode(Eval("Caption").ToString()) %>          
                                   </li>
                                 </ul>
                                </div>
                                </div>
                              </div>
                        </ItemTemplate>
                        </asp:DataList>--%>
                            </td>
                    </tr>
                 
                    </table>

                      
                     

                      <div class="jg_clearboth"></div>
                    </div>
                  </div></div>   
                                  </main>
              </div>        
                          </div>
          </div>
        </div>
      </div>
</asp:Content>

