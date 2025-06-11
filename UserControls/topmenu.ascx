<%@ Control Language="C#" AutoEventWireup="true" CodeFile="topmenu.ascx.cs" Inherits="UserControls_topmenu" %>

<div id="top" class="row">
    <section class="moduletable contacts  span8">
        <div class="mod-article-single mod-article-single__contacts" id="module_89">
            <div class="item__module" id="item_66">
                <div id="fb-root"></div>
                <!-- Intro Text -->
                <div class="item_introtext">
                    <ul class="contacts">
                         <li class="item-148"><a href="Default.aspx" title="Home">Home </a></li> 
                         <li class="item-148"><a href="Careers.aspx" title="Careers">Careers</a></li>
                         <li class="item-148"><a href="contact.aspx" title="Contact">Contact</a></li>
                         <asp:Literal ID="ltrLinks" runat="server"></asp:Literal>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <div class="moduletable   span4">
        <div class="mod-menu__social">
            <ul class="menu social pull-right">
                <li class="item-148"><a class="fa fa-facebook" href="#" target="_blank"  title="Facebook"></a>
                </li>
                <li class="item-150"><a class="fa fa-twitter" href="#" target="_blank" title="Twitter"></a>
                </li>
               <%-- <li class="item-149"><a class="fa fa-google-plus" href="#" title="Google+"></a>
                </li>
                <li class="item-152"><a class="fa fa-linkedin" href="#" title="Linkedin"></a>
                </li>--%>
                 <li class="item-152"><a class="fa fa-youtube" href="https://www.youtube.com/channel/UCYy39zOdBFBt_zQaL7S93Cg" target="_blank" title="Youtube"></a>
                </li>
                 <li class="item-152"><a class="fa fa-instagram" href="#" target="_blank" title="Instagram"></a>
                </li>

                 <%-- <li>
                          <script>
                              (function () {
                                  var cx = '006166533169618325154:io3qkig9iv4';
                                  var gcse = document.createElement('script');
                                  gcse.type = 'text/javascript';
                                  gcse.async = true;
                                  gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
                                  var s = document.getElementsByTagName('script')[0];
                                  s.parentNode.insertBefore(gcse, s);
                              })();
                    </script>
                    <gcse:search></gcse:search>
                    </li>--%>
            </ul>
        </div>
    </div>
</div>
